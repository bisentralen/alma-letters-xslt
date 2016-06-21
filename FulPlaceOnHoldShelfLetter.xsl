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
				<!-- Hvis SMS sendes, så ikke send e-post -->
				<xsl:if test="notification_data/receivers/sms_receiver/phone_list_str != ''">
					<xsl:message terminate="yes">SMS sent, no need for email. </xsl:message>
				</xsl:if>

				<xsl:attribute name="style">
					<xsl:call-template name="bodyStyleCss" /> <!-- style.xsl -->
				</xsl:attribute>

				<xsl:call-template name="head" /> <!-- header.xsl -->
				<!-- <xsl:call-template name="senderReceiver" /> --> <!-- SenderReceiver.xsl -->
				<!-- <xsl:call-template name="toWhomIsConcerned" /> --> <!-- mailReason.xsl -->



					<div class="messageArea">
				<div class="messageBody">
					<table cellspacing="0" cellpadding="5" border="0">
						<tr>
							<td><b><xsl:value-of select="notification_data/receivers/receiver/user/first_name"/>&#160;<xsl:value-of select="notification_data/receivers/receiver/user/last_name"/>,</b></td>
						</tr>
						<tr>
							<td>@@following_item_requested_on@@ <xsl:value-of select="notification_data/request/create_date"/>, @@can_picked_at@@ <xsl:value-of select="notification_data/request/delivery_address"/> <!-- @@circulation_desk@@ -->.</td>
						</tr>

						<tr>
							<td><b><xsl:call-template name="recordTitle" /> <!-- recordTitle.xsl --></b></td>
						</tr>
						
						<xsl:if test="notification_data/request/work_flow_entity/expiration_date">
						<tr>
							<td>
							 @@note_item_held_until@@ <xsl:value-of select="notification_data/request/work_flow_entity/expiration_date"/>.
							 </td>
						</tr>
						</xsl:if>
						

						<!-- Vis Notes/Merknader kun hvis det finnes -->
						<xsl:if test="notification_data/request/system_notes != ''">
							<tr>
								<td><b>@@notes_affect_loan@@:</b></td>
							</tr>

							<tr>
								<td><xsl:value-of select="notification_data/request/system_notes"/></td>
							</tr>
						</xsl:if>

					</table>
				</div>
			</div>
				<br />
				<table>

						<tr><td>@@sincerely@@</td></tr>
						<tr><td>@@department@@</td></tr>

				</table>




				<xsl:call-template name="lastFooter" /> <!-- footer.xsl -->
			</body>
	</html>
	</xsl:template>



</xsl:stylesheet>




