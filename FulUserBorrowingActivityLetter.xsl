<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:include href="header.xsl" />
  <xsl:include href="senderReceiver.xsl" />
  <xsl:include href="mailReason.xsl" />
  <xsl:include href="footer.xsl" />
  <xsl:include href="style.xsl" />
  <xsl:include href="recordTitle.xsl" />

  <xsl:template match="/">
    <html>
      <head>
        <xsl:call-template name="generalStyle" />
      </head>
      <body>
        <xsl:attribute name="style">
          <xsl:call-template name="bodyStyleCss" /><!-- style.xsl -->
        </xsl:attribute>

        <xsl:call-template name="head" /><!-- header.xsl -->
        <!-- <xsl:call-template name="senderReceiver" /> --> <!-- SenderReceiver.xsl -->

		<br />
		<!-- <xsl:call-template name="toWhomIsConcerned" /> --> <!-- mailReason.xsl -->


        <div class="messageArea">
          <div class="messageBody">

			<table cellspacing="0" cellpadding="5" border="0">

				<tr>
					<td><b><xsl:value-of select="notification_data/receivers/receiver/user/first_name"/>&#160;<xsl:value-of select="notification_data/receivers/receiver/user/last_name"/>,</b></td>
				</tr>

			  <xsl:if test="notification_data/item_loans/item_loan or notification_data/overdue_item_loans/item_loan">

	              <tr>
	              	<td>
						@@reminder_message@@
						<br/><br/>
	                </td>
	              </tr>

	              <xsl:if test="notification_data/overdue_item_loans/item_loan">

		              <tr>
		              	<td>
							<b>@@overdue_loans@@</b>
		                </td>
		              </tr>

		              <tr>
		                <td>
		                	<table cellpadding="5" class="listing">
								<xsl:attribute name="style">
									<xsl:call-template name="mainTableStyleCss" /> <!-- style.xsl -->
								</xsl:attribute>
								<tr>
									<th>@@title@@</th>
									<th>@@description@@</th>
									<th>@@author@@</th>
									<th>@@due_date@@</th>
									<th>@@fine@@</th>
									<th>@@library@@</th>
								</tr>

		                		<xsl:for-each select="notification_data/overdue_item_loans/item_loan">
								<tr>
									<td><xsl:value-of select="title"/></td>
									<td><xsl:value-of select="description"/></td>
									<td><xsl:value-of select="author"/></td>
									<td><xsl:value-of select="due_date"/></td>
									<td><xsl:value-of select="fine"/></td>
									<td><xsl:value-of select="library_name"/></td>
								</tr>
								</xsl:for-each>
		                	</table>
		                	<br/>
		                </td>
	              	</tr>

	              </xsl:if>

	              <xsl:if test="notification_data/item_loans/item_loan">

		              <tr>
		              	<td>
							<b>@@loans@@</b>
		                </td>
		              </tr>

		              <tr>
		                <td>
		                	<table cellpadding="5" class="listing">
								<xsl:attribute name="style">
									<xsl:call-template name="mainTableStyleCss" /> <!-- style.xsl -->
								</xsl:attribute>
								<tr>
									<th>@@title@@</th>
									<th>@@due_date@@</th>
									<th>@@fine@@</th>
									<th>@@description@@</th>
								</tr>

		                		<xsl:for-each select="notification_data/item_loans/item_loan">
								<tr>
									<td><xsl:value-of select="title"/></td>
									<td><xsl:value-of select="due_date"/></td>
									<td><xsl:value-of select="fine"/></td>
									<td><xsl:value-of select="description"/></td>
								</tr>
								</xsl:for-each>

		                	</table>
		                	<br/>
		                </td>
		              </tr>

		      		</xsl:if>

			  </xsl:if>

			  <xsl:if test="notification_data/organization_fee_list/string">
	              <tr>
	              	<td>
						<b>@@debt_message@@</b>
	                </td>
	              </tr>

	              <xsl:for-each select="notification_data/organization_fee_list/string">
	              	<tr>
						<td><xsl:value-of select="."/></td>
					</tr>
	              </xsl:for-each>

				  <tr>
	              	<td>
						<b>
						@@total@@ <xsl:value-of select="notification_data/total_fee"/>
						</b>
	                </td>
	              </tr>
	              	<xsl:choose>
	              	<xsl:when test="notification_data/receivers/receiver/preferred_language='no'">
	              		<tr><td>Betal gebyret i skranken i biblioteket, med kort eller kontanter.</td></tr>
	              		<tr><td>Alternativt: Til kontonummer <b>8200.01.39838</b><br/>
	              		Merk betalingen med <b>Navnet ditt</b> og <b>"Purregebyr biblioteket"</b></td></tr>
	              	</xsl:when>
	              	<xsl:otherwise>
	              		<tr><td>Please pay the fine at the library information desk with cash or credit card.</td></tr>
	              		<tr><td>Alternatively: Pay to account no <b>8200.01.39838</b><br/>
	              		Please include <b>Your name</b> and <b>"Purregebyr biblioteket"</b> (overdue fine library).</td></tr>
	              	</xsl:otherwise>
	              	</xsl:choose>

	            	<xsl:choose>
		              <xsl:when test="notification_data/receivers/receiver/preferred_language='no'">
		                <tr><td>Vi minner om at Biblioteket ilegger purregebyr etter at lånet har forfalt (kr 5,- pr. bok pr. dag). Ved tap av lånt bok, krever vi erstatning for denne.</td></tr>
		              </xsl:when>
		              <xsl:otherwise>
		              	<tr><td>
		                We would like to remind you about out policy: If you return books after the due date, you recieve a penalty fine of 5 NOK per day, for each book. If you lose the book, you have to pay for it.</td></tr>
		              </xsl:otherwise>
		            </xsl:choose>
		        

	            <!--
	              <tr>
	              	<td>
						<b>@@please_pay_message@@</b>
						<br/><br/>
	                </td>
	              </tr>
	          	-->

			  </xsl:if>
            </table>

			<br />

			
			<table>
				<tr><td><!-- @@sincerely@@  --></td></tr>
				<tr><td><!-- @@department@@ --></td></tr>
			</table>
			

          </div>
        </div>

        <br/>
        <br/>
        <!-- footer.xsl -->
        <xsl:call-template name="myAccount" />
		<xsl:call-template name="contactUs" />
		<xsl:call-template name="lastFooter" />

      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
