<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="header.xsl" />
<xsl:include href="senderReceiver.xsl" />
<xsl:include href="mailReason.xsl" />
<xsl:include href="footer.xsl" />
<xsl:include href="style.xsl" />

<xsl:template match="/">
	<html>
		<head>
		<xsl:call-template name="generalStyle" />
		</head>

			<body>
			<xsl:attribute name="style">
				<xsl:call-template name="bodyStyleCss" /> <!-- style.xsl -->
			</xsl:attribute>

				<xsl:call-template name="head" /> <!-- header.xsl -->
				<!-- <xsl:call-template name="senderReceiver" /> --> <!-- SenderReceiver.xsl -->

				<br />

		<table cellspacing="0" cellpadding="5" border="0">
				<tr>
					<td><b><xsl:value-of select="notification_data/receivers/receiver/user/first_name"/>&#160;<xsl:value-of select="notification_data/receivers/receiver/user/last_name"/>,</b></td>
				</tr>

				<tr>
				<td>
					<!-- <h>@@dear@@ </h> <br/><br/> -->
					<h>@@we_would_like@@ <!-- <xsl:value-of select="notification_data/organization_unit/name"/> --> 
					<xsl:choose>
		              	<xsl:when test="notification_data/receivers/receiver/preferred_language='no'">    BI Biblioteket
		              	</xsl:when>
		              	<xsl:otherwise>
		              		BI Library
		              	</xsl:otherwise>
		            </xsl:choose>
					@@debt_of@@ <b><xsl:value-of select="notification_data/total_fines_amount"/>&#160;<xsl:value-of select="notification_data/total_fines_currency"/></b>

					</h>
				</td>
				</tr>
				</table>

				<table cellpadding="5" class="listing">
				<xsl:attribute name="style">
					<xsl:call-template name="mainTableStyleCss" /> <!-- style.xsl -->
				</xsl:attribute>

				<table cellpadding="5" class="listing">
				<xsl:attribute name="style">
					<xsl:call-template name="mainTableStyleCss" /> <!-- style.xsl -->
				</xsl:attribute>
					<tr>
						<th>@@fee_type@@</th>
						<th>@@fee_amount@@</th>
						<th>@@note@@</th>
					</tr>
					<xsl:for-each select="notification_data/fines_fees_list/user_fines_fees">
					<tr>
						<td><xsl:value-of select="fine_fee_type_display"/></td>
						<td><xsl:value-of select="fine_fee_ammount/sum"/>&#160;<xsl:value-of select="fine_fee_ammount/currency"/></td>
						<td><xsl:value-of select="fine_comment"/></td>
					</tr>
					</xsl:for-each>

				</table><br />

				<!-- <h><b>@@please_settle@@</b></h> -->

				<!-- BIs hardkodede info om betalingsmåte: -->
				<table>
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
	        	</table>
	        	<br/><br/>
	        	<table>
		        	<xsl:choose>
		              <xsl:when test="notification_data/receivers/receiver/preferred_language='no'">
		                <tr><td>Vi minner om at Biblioteket ilegger purregebyr etter at lånet har forfalt (kr 5,- pr. bok pr. dag). Ved tap av lånt bok, krever vi erstatning for denne.</td></tr>
		              </xsl:when>
		              <xsl:otherwise>
		              	<tr><td>
		                We would like to remind you about out policy: If you return books after the due date, you recieve a penalty fine of 5 NOK per day, for each book. If you lose the book, you have to pay for it.</td></tr>
		              </xsl:otherwise>
		            </xsl:choose>
		        </table>

				<br />
				<br />
				<table>
						<tr><td>@@sincerely@@</td></tr>
						<tr><td>@@department@@</td></tr>
				</table>
				</table>
				<br />

				<xsl:call-template name="lastFooter" /> <!-- footer.xsl -->
			</body>
	</html>
</xsl:template>

</xsl:stylesheet>