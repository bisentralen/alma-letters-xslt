<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="salutation">

</xsl:template>

<xsl:variable name="letternamevar" select="notification_data/general_data/letter_name" />


<xsl:template name="lastFooter">
	<table>
	<xsl:attribute name="style">
		<xsl:call-template name="footerTableStyleCss" /> <!-- style.xsl -->
	</xsl:attribute>

	<tr>
	<xsl:attribute name="style">
		<xsl:call-template name="listStyleCss" /> <!-- style.xsl -->
	</xsl:attribute>
	</tr>
	<!-- <tr><td><xsl:value-of select="notification_data/organization_unit/name"/>&#160;</td></tr> -->

    <!-- BI Custom Footer by Fredrik. For letters to users: The footer depends on user campus. This does not work with the organization_unit nodes, as of 02.02.2016. Because the footer is hard coded, language (norwegian/other=english) is tested for as well -->
    
    <!-- For letters to vendors: The footer uses the organization_unit variables. Vendors does not have campus_code -->

	<xsl:choose>
		<xsl:when test="notification_data/receivers/receiver/user/campus_code='BIBER'">
			<xsl:choose>
    			<xsl:when test="notification_data/receivers/receiver/preferred_language='no'">
    				<tr><td>Handelshøyskolen BI - campus Bergen, biblioteket</td></tr>
    				<tr><td>Send svar til: <a href="mailto:biblioteket.bergen@bi.no?subject=Re: {$letternamevar}">biblioteket.bergen@bi.no</a></td></tr>
    			</xsl:when>
    			<xsl:otherwise>
    				<tr><td>BI Library - campus Bergen</td></tr>
    				<tr><td>Reply to: <a href="mailto:biblioteket.bergen@bi.no?subject=Re: {$letternamevar}">biblioteket.bergen@bi.no</a></td></tr>
    			</xsl:otherwise>
	        </xsl:choose>
    	</xsl:when>
    	<xsl:when test="notification_data/receivers/receiver/user/campus_code='BITRO'">
			<xsl:choose>
    			<xsl:when test="notification_data/receivers/receiver/preferred_language='no'">
    				<tr><td>Handelshøyskolen BI - campus Trondheim, biblioteket</td></tr>
    				<tr><td>Send svar til: <a href="mailto:biblioteket.trondheim@bi.no?subject=Re: {$letternamevar}">biblioteket.trondheim@bi.no</a></td></tr>
    			</xsl:when>
    			<xsl:otherwise>
    				<tr><td>BI Library - campus Trondheim</td></tr>
    				<tr><td>Reply to: <a href="mailto:biblioteket.trondheim@bi.no?subject=Re: {$letternamevar}">biblioteket.trondheim@bi.no</a></td></tr>
    			</xsl:otherwise>
    		</xsl:choose>
    	</xsl:when>
    	<xsl:when test="notification_data/receivers/receiver/user/campus_code='BISTA'">
			<xsl:choose>
    			<xsl:when test="notification_data/receivers/receiver/preferred_language='no'">
    				<tr><td>Handelshøyskolen BI - campus Stavanger, biblioteket</td></tr>
    				<tr><td>Send svar til: <a href="mailto:biblioteket.stavanger@bi.no?subject=Re: {$letternamevar}">biblioteket.stavanger@bi.no</a></td></tr>
    			</xsl:when>
    			<xsl:otherwise>
    				<tr><td>BI Library - campus Stavanger</td></tr>
    				<tr><td>Reply to: <a href="mailto:biblioteket.stavanger@bi.no?subject=Re: {$letternamevar}">biblioteket.stavanger@bi.no</a></td></tr>
    			</xsl:otherwise>
    		</xsl:choose>
    	</xsl:when>
    	<xsl:when test="notification_data/receivers/receiver/user/campus_code = 'BIOSL'">
			<xsl:choose>
    			<xsl:when test="notification_data/receivers/receiver/preferred_language='no'">
    				<tr><td>Handelshøyskolen BI - campus Oslo, biblioteket</td></tr>
    				<tr><td>Send svar til: <a href="mailto:biblioteket@bi.no?subject=Re: {$letternamevar}">biblioteket@bi.no</a></td></tr>
    			</xsl:when>
    			<xsl:otherwise>
    				<tr><td>BI Library - campus Oslo</td></tr>
    				<tr><td>Reply to: <a href="mailto:biblioteket@bi.no?subject=Re: {$letternamevar}">biblioteket@bi.no</a></td></tr>
    			</xsl:otherwise>
	        </xsl:choose>
    	</xsl:when>
    	<!-- If OrderListLetter to a Vendor -->
    	<xsl:when test="notification_data/general_data/letter_type='OrderListLetter'">
    		<xsl:choose>
    			<xsl:when test="notification_data/receivers/receiver/preferred_language='no' or notification_data/receivers/receiver/preferred_language='nob'">
    				<tr><td><xsl:value-of select="notification_data/organization_unit/name"/></td></tr>
    				<tr><td>Send svar til: <xsl:value-of select="notification_data/organization_unit/email/email"/></td></tr>
    			</xsl:when>
    			<xsl:otherwise>
    				<tr><td><xsl:value-of select="notification_data/organization_unit/name"/></td></tr>
    				<tr><td>Reply to: <xsl:value-of select="notification_data/organization_unit/email/email"/></td></tr>
    			</xsl:otherwise>
	        </xsl:choose>
    	</xsl:when>
    	<!-- Hvis alt feiler -->
    	<xsl:otherwise>
			<tr><td>Handelshøyskolen BI, biblioteket / BI Library</td></tr>
			<tr><td>Send svar til / Reply to: <xsl:value-of select="notification_data/organization_unit/email/email"/></td></tr>
    	</xsl:otherwise>
    </xsl:choose>


	</table>
</xsl:template>










<xsl:template name="contactUs">
	<table align="left">
	<tr>
	<td align="left">
	<a>
                        <xsl:attribute name="href">
                          @@email_contact_us@@
                        </xsl:attribute>
						@@contact_us@@
					</a>
	</td>
</tr>
	</table>
</xsl:template>

<xsl:template name="myAccount">
	<table align="right">
	<tr>
	<td align="right">
	<a>
                        <xsl:attribute name="href">
                          @@email_my_account@@
                        </xsl:attribute>
						@@my_account@@
					</a>
	</td>
</tr>
	</table>
</xsl:template>



</xsl:stylesheet>