<?xml version = "1.0" encoding = "UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:stock="http://www.ineasysteps.com/xsd">
  <xsl:template match="/stock:doc">

    <html>
      <body>
        <table >
          <tr style="background-color:black; color:white">
            <th>Symbol</th>
            <th>Price</th>
            <th>CEO</th>
          </tr>
          <xsl:for-each select="stock:item">
            <xsl:if test="stock:price &gt; 70">
              <tr>
                <xsl:attribute name="class">
                  <xsl:choose>
                  <!-- This is where the magic happens: -->
                      <xsl:when test="position() mod 2 = 0">even</xsl:when>
                      <xsl:when test="position() mod 2 = 1">odd</xsl:when>
                  </xsl:choose>
                </xsl:attribute>
                <td><xsl:value-of select="stock:symbol"/></td>
                <td>$<xsl:value-of select="stock:price"/></td>
                <td><xsl:value-of select="stock:ceo"/></td>
              </tr>
            </xsl:if>
          </xsl:for-each>
        </table>
        <p>
          The count of stocks that cost more than $70.00 is 
          <xsl:value-of select="count(/stock:doc/stock:item[stock:price > 70])" />
        </p>
        
        <style>
          .odd {
            background-color: cyan;
          }
          .even {
            background-color: lightgray;
          }
        </style>
      </body>
    </html>

  </xsl:template>
</xsl:stylesheet>