<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template name="recordTitle">
		<xsl:value-of select="substring(notification_data/phys_item_display/title, 1,30)"/>
	</xsl:template>

</xsl:stylesheet>