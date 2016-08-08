<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:ext="http://exslt.org/common" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:include href="header.xsl"/>
	<xsl:include href="senderReceiver.xsl"/>
	<xsl:include href="mailReason.xsl"/>
	<xsl:include href="footer.xsl"/>
	<xsl:include href="style.xsl"/>
	<xsl:include href="recordTitle.xsl"/>
	<xsl:template match="/">
		<!-- BI: Summere løpende gebyrer -->
		<xsl:variable name="x">
			<xsl:for-each select="notification_data/loans_by_library/library_loans_for_display/item_loans/overdue_and_lost_loan_notification_display/item_loan">
				<n>
					<xsl:value-of select="translate(fine,' NOK','')"/>
				</n>
			</xsl:for-each>
		</xsl:variable>
		<xsl:variable name="runningSum">
			<xsl:value-of select="sum(ext:node-set($x)/n)"/>
		</xsl:variable>
		<!-- Gebyr i Active Balance -->
		<xsl:variable name="standingFine">
			<xsl:value-of select="translate(notification_data/total_fee,',00 NOK','.00')"/>
		</xsl:variable>
		<!-- BI slutt -->
		<html>
			<head>
				<xsl:call-template name="generalStyle"/>
			</head>
			<body>
				<xsl:attribute name="style">
					<xsl:call-template name="bodyStyleCss"/>
					<!-- style.xsl -->
				</xsl:attribute>
				<xsl:call-template name="head"/>
				<!-- header.xsl -->
				<!-- <xsl:call-template name="senderReceiver" />-->
				<!-- SenderReceiver.xsl -->
				<br/>
				<!-- <xsl:call-template name="toWhomIsConcerned" />-->
				<!-- mailReason.xsl -->
				<div class="messageArea">
					<div class="messageBody">
						<table border="0" cellpadding="5" cellspacing="0">
							<tr>
								<td>
									<b>
										<xsl:value-of select="notification_data/receivers/receiver/user/first_name"/>&#160;<xsl:value-of select="notification_data/receivers/receiver/user/last_name"/>,</b>
								</td>
							</tr>
							<xsl:if test="notification_data/item_loans/item_loan or notification_data/overdue_item_loans/item_loan">
								<tr>
									<td>@@reminder_message@@
						
										<br/>
										<br/></td>
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
													<xsl:call-template name="mainTableStyleCss"/>
													<!-- style.xsl -->
												</xsl:attribute>
												<tr>
													<th>@@title@@</th>
													<!-- <th>@@description@@</th>OAS 22.06.16-->
													<th>@@author@@</th>
													<th>@@due_date@@</th>
													<th>@@fine@@</th>
													<!-- <th>@@library@@</th>OAS 22.06.16-->
												</tr>
												<xsl:for-each select="notification_data/overdue_item_loans/item_loan">
													<tr>
														<td>
															<xsl:value-of select="title"/>
														</td>
														<!-- <td><xsl:value-of select="description"/></td>OAS 22.06.16 -->
														<td>
															<xsl:value-of select="author"/>
														</td>
														<td>
															<xsl:value-of select="due_date"/>
														</td>
														<td>
															<xsl:value-of select="fine"/>
														</td>
														<!-- <td><xsl:value-of select="library_name"/></td>OAS 22.06.16 -->
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
													<xsl:call-template name="mainTableStyleCss"/>
													<!-- style.xsl -->
												</xsl:attribute>
												<tr>
													<th>@@title@@</th>
													<th>@@due_date@@</th>
													<!-- <th>@@fine@@</th> OAS 22.06.16 -->
													<!-- <th>@@description@@</th>OAS 22.06.16-->
												</tr>
												<xsl:for-each select="notification_data/item_loans/item_loan">
													<tr>
														<td>
															<xsl:value-of select="title"/>
														</td>
														<td>
															<xsl:value-of select="due_date"/>
														</td>
														<td>
															<xsl:value-of select="fine"/>
														</td>
														<!-- <td><xsl:value-of select="description"/></td>OAS 22.06.16 -->
													</tr>
												</xsl:for-each>
											</table>
											<br/>
										</td>
									</tr>
								</xsl:if>
							</xsl:if>
							<!-- For testing
			  <tr><td><xsl:value-of select="$runningSum"/></td></tr><tr><td><xsl:value-of select="notification_data/total_fee"/></td></tr>-->
							

							<tr><td>&#160;</td></tr>

							<!-- Test om Active Balance eller løpende gebyr finnes -->
							<tr>
								<xsl:if test="notification_data/total_fee != '' or $runningSum != '0'">
								<xsl:if test="notification_data/total_fee != '' or $runningSum != 'NaN'">
									<!-- Test om løpende gebyr finnes -->
									<xsl:if test="$runningSum != '0'">
										<xsl:if test="$runningSum != 'NaN'">
											<tr>
												<td>
													<xsl:choose>
														<xsl:when test="notification_data/receivers/receiver/preferred_language='no'">Sum gebyr på bøker du låner nå (se tabell over): 
															<xsl:value-of select="format-number($runningSum,'#,###.00')"/>
															NOK </xsl:when>
														<xsl:otherwise>Total fines on books you borrow (See table above): 
															<xsl:value-of select="format-number($runningSum,'#,###.00')"/>
															NOK </xsl:otherwise>
													</xsl:choose>
												</td>
											</tr>
										</xsl:if>
									</xsl:if>
									<xsl:if test="notification_data/total_fee != ''">
										<tr>
											<td>@@debt_message@@ 
												<xsl:value-of select="$standingFine"/>
												NOK</td>
										</tr>
										<tr>
											<xsl:if test="$runningSum != '0'">
												<td>
													<b>@@total@@ 
														<xsl:value-of select="format-number($runningSum + $standingFine,'#,###.00')"/>
														NOK</b>
												</td>
											</xsl:if>
											<xsl:if test="$runningSum = '0'">
												<td>
													<b>@@total@@ 
														<xsl:value-of select="format-number($standingFine,'#,###.00')"/>
														NOK</b>
												</td>
											</xsl:if>
										</tr>
									</xsl:if>
									<tr>
										<td/>
									</tr>
									<!-- <tr><td><b>@@please_pay_message@@</b><br/><br/></td></tr> -->
								
									<xsl:choose>
									<xsl:when test="notification_data/receivers/receiver/preferred_language='no'">
										<tr>
											<td>Betal gebyret i skranken i biblioteket, med 
												<xsl:choose>
													<xsl:when test="notification_data/receivers/receiver/user/campus_code = 'BIOSL'">kort eller kontanter.</xsl:when>
													<xsl:otherwise>Vipps eller kontanter.</xsl:otherwise></xsl:choose>
											</td>
										</tr>
									</xsl:when>
									<xsl:otherwise>
										<tr>
											<td>Please pay the fine at the library information desk with 
												<xsl:choose>
													<xsl:when test="notification_data/receivers/receiver/user/campus_code = 'BIOSL'">cash or credit card.</xsl:when>
													<xsl:otherwise>cash or Vipps.</xsl:otherwise></xsl:choose>
											</td>
										</tr>
									</xsl:otherwise>
								</xsl:choose>
								
								<xsl:choose>
									<xsl:when test="notification_data/receivers/receiver/preferred_language='no'">
										<tr>
											<td>Vi minner om at biblioteket ilegger daglig purregebyr etter at lånet har forfalt (kr 5,- pr. bok pr. dag på vanlige lån / kr 10,- pr. bok pr dag på dagslån). Ved tap av lånt bok, krever vi erstatning for denne.</td>
										</tr>
									</xsl:when>
									<xsl:otherwise>
										<tr>
											<td>We would like to remind you about our policy: If you return books after the due date, you receive a penalty fine of 5 NOK per day for regular loans and 10 NOK per day for one day loans, for each book. If you lose the book, you have to pay for it.</td>
										</tr>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:if>
							</xsl:if>


							<!-- teste verdier: -->
							<!-- <td><xsl:value-of select="notification_data/total_fee"/>,<xsl:value-of select="$runningSum"/></td> -->

						</tr>
						</table>

						<br/>
						
						<table>
							<tr>
								<td>
									<!-- @@sincerely@@  -->
								</td>
							</tr>
							<tr>
								<td>
									<!-- @@department@@ -->
								</td>
							</tr>
						</table>
					</div>
				</div>
				<br/>
				<br/>
				<!-- footer.xsl -->
				<xsl:call-template name="myAccount"/>
				<xsl:call-template name="contactUs"/>
				<xsl:call-template name="lastFooter"/>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>