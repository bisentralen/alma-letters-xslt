<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="smsRecordTitle.xsl" />

<xsl:template match="/">

<!-- String with library name -->
<xsl:variable name="libNameString">
	<xsl:value-of select="/notification_data/request/calculated_destination_name"/>
</xsl:variable>

<xsl:value-of select="notification_data/receivers/receiver/user_phone/phone"/> : <xsl:value-of select="notification_data/organization_unit/name"/>.
@@following_item_requested_on@@ <xsl:value-of select="translate(notification_data/request/create_date, '/', '.')"/>,
@@can_picked_at@@ BI @@circulation_desk@@,
<xsl:if test="contains($libNameString,'Oslo')">
	campus Oslo:
</xsl:if>
<xsl:if test="contains($libNameString,'Bergen')">
	campus Bergen:
</xsl:if>
<xsl:if test="contains($libNameString,'Trondheim')">
	campus Trondheim:
</xsl:if>
<xsl:if test="contains($libNameString,'Stavanger')">
	campus Stavanger:
</xsl:if>
&#39;<xsl:call-template name="recordTitle" />&#39;.
<xsl:if test="notification_data/request/work_flow_entity/expiration_date">
	@@note_item_held_until@@ <xsl:value-of select="translate(notification_data/request/work_flow_entity/expiration_date, '/', '.')"/>.
</xsl:if>


</xsl:template>
</xsl:stylesheet>