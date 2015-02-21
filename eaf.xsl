<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <!-- Identity template, copies everything as is -->
  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="/">
    <html>
      <head>
        <title><xsl:value-of select="/ANNOTATION_DOCUMENT/@DATE"/></title>
        <script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
        <script src="js/eaf.js"></script>
      </head>
      <body>
        <div id="1ort" style="top: 10px; position: absolute;"></div>
        <div id="2ort" style="top: 110px; position: absolute;"></div>
        <div id="1meta" style="top: 210px; position: absolute;"></div>
        <div id="2meta" style="top: 310px; position: absolute;"></div>
        <div id="META" style="top: 410px; position: absolute;"></div>
        <!-- instead of sorting the tiers by reaching into the time_order, sort the -->
        <!-- time_order and reach into the tiers to extract the corresponding -->
        <!-- annotations -->
        <xsl:for-each select="//TIME_SLOT">
          <xsl:sort select="./TIME_VALUE" data-type="number"/>
          <xsl:variable name="ts_id" select="./@TIME_SLOT_ID"/>
          <xsl:variable name="t_val1" select="./@TIME_VALUE"/>
          <!-- I'll probably need to add another for-each here to iterate over all -->
          <!-- the ALIGNABLE_ANNOTATION whose TIME_SLOT_REF1 matches $ts_id - if -->
          <!-- two start at the same time, I'm probably taking only the first one -->
          <!-- right now... -->
          <xsl:variable name="aannot_id"
                        select="//ALIGNABLE_ANNOTATION[@TIME_SLOT_REF1 =
                                $ts_id]/@ANNOTATION_ID"/>
          <xsl:variable name="aannot_end_tref"
                        select="//ALIGNABLE_ANNOTATION[@TIME_SLOT_REF1 =
                                $ts_id]/@TIME_SLOT_REF2"/>
          <xsl:variable name="t_val2" select="//TIME_SLOT[@TIME_SLOT_ID =
                                              $aannot_end_tref]/@TIME_VALUE"/>
          <xsl:variable name="tier_id"
                        select="translate(//ALIGNABLE_ANNOTATION[@TIME_SLOT_REF1
                                = $ts_id]/../../@TIER_ID, ' ', '')"/>

          <div id="{$aannot_id}" class="annotation {$tier_id}"
               style="display: block; left:
                      {$t_val1 div 5}px; border: 1px solid black;
                      position: absolute; width: {($t_val2 -
                      $t_val1) div 5}px;">
            <p>
              <xsl:value-of select="//ALIGNABLE_ANNOTATION[@TIME_SLOT_REF1 =
                                    $ts_id]//ANNOTATION_VALUE"/>
              <xsl:if test="//REF_ANNOTATION[@ANNOTATION_REF =
                            $aannot_id]//ANNOTATION_VALUE != ''">
                <br/>
                <xsl:value-of select="//REF_ANNOTATION[@ANNOTATION_REF =
                                      $aannot_id]//ANNOTATION_VALUE"/>
              </xsl:if>
            </p>
          </div>
        </xsl:for-each>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
