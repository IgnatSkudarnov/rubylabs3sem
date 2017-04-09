<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <body>
        <p>palindroms were found<p>
        <div class='table'>
          <div class='row header'>
            <div class='cell'>Number</div>
            <div class='cell'>Squared Number</div>
          </div>
          <xsl:for-each select='//result/value/value'>
            <xsl:choose>
            <xsl:when test="not(. = '') and not(position() = '1')">
            <div class='row'>
              <div class='cell'><xsl:value-of select="position()"/></div>
              <div class='cell'><xsl:value-of select="."/></div>
            </div>
            </xsl:when>
            </xsl:choose>
          </xsl:for-each>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>