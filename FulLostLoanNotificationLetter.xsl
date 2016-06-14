<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:include href="header.xsl" />
	<xsl:include href="senderReceiver.xsl" />
	<xsl:include href="footer.xsl" />
	<xsl:include href="style.xsl" />

	<xsl:template match="/">
		<html>
			<head>
				<xsl:call-template name="generalStyle" />
			</head>

			<body>
				<xsl:attribute name="style">
					<xsl:call-template name="bodyStyleCss" />
					<!-- style.xsl -->
				</xsl:attribute>

				<xsl:call-template name="head" />
				<!-- header.xsl -->
				<xsl:call-template name="senderReceiver" />
				<!-- SenderReceiver.xsl -->

				<br />

				<xsl:choose>
					<!-- Type 1 -->
					<xsl:when test="notification_data/notification_type='OverdueNotificationType1'">
						<table cellspacing="0" cellpadding="5" border="0">
							<tr>
								<td>
									<h>@@inform_you_item_below@@ </h>
									<h>@@borrowed_by_you@@ @@decalred_as_lost@@</h>
								</td>
							</tr>
						</table>
						<p /><br />
						<table cellpadding="5" class="listing">
							<xsl:attribute name="style">
								<xsl:call-template name="mainTableStyleCss" />
								<!-- style.xsl -->
							</xsl:attribute>

							<xsl:for-each select="notification_data/item_loan">
								<table>
									<tr>
										<td><b>@@lost_item@@:</b></td><td><xsl:value-of select="title"/></td>
									</tr>
									<tr>
										<td><b>@@loan_date@@:</b></td><td><xsl:value-of select="loan_date"/></td>
									</tr>
									<tr>
										<td><b>@@due_date@@:</b></td><td><xsl:value-of select="due_date"/></td>
									</tr>
									<tr>
										<td><b>@@barcode@@:</b></td><td><xsl:value-of select="barcode"/></td>
									</tr>
								</table>
							</xsl:for-each>
							<p /><br />
							<table cellpadding="5" class="listing">
								<xsl:attribute name="style">
									<xsl:call-template name="mainTableStyleCss" />
									<!-- style.xsl -->
								</xsl:attribute>
								<tr>
									<th>@@fee_type@@</th>
									<th>@@fee_amount@@</th>
									<th>@@note@@</th>
								</tr>
								<xsl:for-each select="notification_data/fines_fees_list/user_fines_fees">
									<tr>
										<td>
											<xsl:choose>
											<xsl:when test="fine_fee_type_display='Forfallsgebyr'">
												Purregebyr pr. nå
											</xsl:when>
											<xsl:when test="fine_fee_type_display='Erstatningsgebyr ved tap'">
												Erstatningssum ved evnt. tap
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="fine_fee_type_display"/>
											</xsl:otherwise>
											</xsl:choose>
										</td>
										<td>
											<xsl:value-of select="fine_fee_ammount/sum"/>&#160;<xsl:value-of select="fine_fee_ammount/currency"/>
										</td>
										<td>
											<xsl:value-of select="ff"/>
										</td>
									</tr>
								</xsl:for-each>

							</table>
							<br />
							<br />
				@@additional_info_1@@
							<br />
				@@additional_info_2@@
							<br />

						</table>
					</xsl:when>

					<!-- Type 2 -->
					<xsl:when test="notification_data/notification_type='OverdueNotificationType2'">
						<table cellspacing="0" cellpadding="5" border="0">
							<tr>
								<td>
									<h>@@inform_you_item_below@@ </h>
									<h>@@borrowed_by_you@@ @@decalred_as_lost@@</h>
								</td>
							</tr>
						</table>
						<p /><br />
						<table cellpadding="5" class="listing">
							<xsl:attribute name="style">
								<xsl:call-template name="mainTableStyleCss" />
								<!-- style.xsl -->
							</xsl:attribute>

							<xsl:for-each select="notification_data/item_loan">
								<table>
									<tr>
										<td><b>@@lost_item@@:</b></td><td><xsl:value-of select="title"/></td>
									</tr>
									<tr>
										<td><b>@@loan_date@@:</b></td><td><xsl:value-of select="loan_date"/></td>
									</tr>
									<tr>
										<td><b>@@due_date@@:</b></td><td><xsl:value-of select="due_date"/></td>
									</tr>
									<tr>
										<td><b>@@barcode@@:</b></td><td><xsl:value-of select="barcode"/></td>
									</tr>
								</table>
							</xsl:for-each>
							<p /><br />
							<table cellpadding="5" class="listing">
								<xsl:attribute name="style">
									<xsl:call-template name="mainTableStyleCss" />
									<!-- style.xsl -->
								</xsl:attribute>
								<tr>
									<th>@@fee_type@@</th>
									<th>@@fee_amount@@</th>
									<th>@@note@@</th>
								</tr>
								<xsl:for-each select="notification_data/fines_fees_list/user_fines_fees">
									<tr>
										<td>
											<xsl:choose>
											<xsl:when test="fine_fee_type_display='Forfallsgebyr'">
												Purregebyr pr. nå
											</xsl:when>
											<xsl:when test="fine_fee_type_display='Erstatningsgebyr ved tap'">
												Erstatningssum ved evnt. tap
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="fine_fee_type_display"/>
											</xsl:otherwise>
											</xsl:choose>
										</td>
										<td>
											<xsl:value-of select="fine_fee_ammount/sum"/>&#160;<xsl:value-of select="fine_fee_ammount/currency"/>
										</td>
										<td>
											<xsl:value-of select="ff"/>
										</td>
									</tr>
								</xsl:for-each>

							</table>
							<br />
							<br />
				@@additional_info_1@@
							<br />
				@@additional_info_2@@
							<br />

						</table>
					</xsl:when>
				

					<!-- Type 3 -->
					<xsl:when test="notification_data/notification_type='OverdueNotificationType3'">
						<table cellspacing="0" cellpadding="5" border="0">
							<tr>
								<td>
									<h>@@inform_you_item_below@@ </h>
									<h>@@borrowed_by_you@@ @@decalred_as_lost@@</h>
								</td>
							</tr>
						</table>
						<p /><br />
						<table cellpadding="5" class="listing">
							<xsl:attribute name="style">
								<xsl:call-template name="mainTableStyleCss" />
								<!-- style.xsl -->
							</xsl:attribute>

							<xsl:for-each select="notification_data/item_loan">
								<table>
									<tr>
										<td><b>@@lost_item@@:</b></td><td><xsl:value-of select="title"/></td>
									</tr>
									<tr>
										<td><b>@@loan_date@@:</b></td><td><xsl:value-of select="loan_date"/></td>
									</tr>
									<tr>
										<td><b>@@due_date@@:</b></td><td><xsl:value-of select="due_date"/></td>
									</tr>
									<tr>
										<td><b>@@barcode@@:</b></td><td><xsl:value-of select="barcode"/></td>
									</tr>
								</table>
							</xsl:for-each>
							<p /><br />
							<table cellpadding="5" class="listing">
								<xsl:attribute name="style">
									<xsl:call-template name="mainTableStyleCss" />
									<!-- style.xsl -->
								</xsl:attribute>
								<tr>
									<th>@@fee_type@@</th>
									<th>@@fee_amount@@</th>
									<th>@@note@@</th>
								</tr>
								<xsl:for-each select="notification_data/fines_fees_list/user_fines_fees">
									<tr>
										<td>
											<xsl:choose>
											<xsl:when test="fine_fee_type_display='Forfallsgebyr'">
												Purregebyr pr. nå
											</xsl:when>
											<xsl:when test="fine_fee_type_display='Erstatningsgebyr ved tap'">
												Erstatningssum ved evnt. tap
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="fine_fee_type_display"/>
											</xsl:otherwise>
											</xsl:choose>
										</td>
										<td>
											<xsl:value-of select="fine_fee_ammount/sum"/>&#160;<xsl:value-of select="fine_fee_ammount/currency"/>
										</td>
										<td>
											<xsl:value-of select="ff"/>
										</td>
									</tr>
								</xsl:for-each>

							</table>
							<br />
							<br />
				@@additional_info_1@@
							<br />
				@@additional_info_2@@
							<br />

							
						</table>
					</xsl:when>
				</xsl:choose>


				<table>
					<tr><td>
						<xsl:choose>
			              <xsl:when test="notification_data/receivers/receiver/preferred_language='no'">
			                <tr><td>Biblioteket ilegger purregebyr etter at lånet har forfalt (kr 5,- pr. bok pr. dag. Dagslån: kr 10,-). Ved tap av lånt bok, krever vi erstatning for denne.</td></tr>
			              </xsl:when>
			              <xsl:otherwise>
			              	<tr><td>
			                Our policy: If you return books after the due date, you recieve a penalty fine of 5 NOK per day, for each book (1-day loan: 10 NOK). If you lose the book, you have to pay for it.</td></tr>
			              </xsl:otherwise>
			            </xsl:choose>
			        </td></tr>
				</table>
				<p /><br />
				<table>

					<tr>
						<td>@@sincerely@@</td>
					</tr>
					<tr>
						<td>@@department@@</td>
					</tr>

				</table>




				<xsl:call-template name="lastFooter" />
				<!-- footer.xsl -->
			</body>
		</html>
	</xsl:template>

</xsl:stylesheet>