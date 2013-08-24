<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:str="http://www.quickbundle.org" xmlns:fn="http://www.w3.org/2005/04/xpath-functions" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xdt="http://www.w3.org/2005/02/xpath-datatypes" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!--导入全局定义-->
	<xsl:import href="../../global.xsl"/>
	<!--忽略xml声明-->
	<xsl:output method="text" omit-xml-declaration="yes" encoding="UTF-8"/>
	<!--处理table-->
	<xsl:template match="table">
		<xsl:param name="thisFilePathName">
			<xsl:value-of select="$javaPackageName"/>.<xsl:value-of select="$tableDirName"/>.vo --> <xsl:value-of select="$tableName"/>Vo.java</xsl:param>
		<xsl:value-of select="str:getJavaFileComment($thisFilePathName, $projectName, $authorName)"/>package <xsl:value-of select="$javaPackageName"/>.<xsl:value-of select="$tableDirName"/>.vo;

<xsl:if test="column[@dataType='java.sql.Date']">
import java.sql.Date;
</xsl:if>
		<xsl:if test="column[@dataType='java.sql.Timestamp']">
import java.sql.Timestamp;
</xsl:if>
		<xsl:if test="column[@dataType='java.math.BigDecimal']">
import java.math.BigDecimal;
</xsl:if>

import org.quickbundle.base.vo.RmValueObject;

<xsl:value-of select="str:getClassComment($authorName)"/>
public class <xsl:value-of select="$tableFormatName"/>Vo extends RmValueObject{

    private static final long serialVersionUID = 1;
<xsl:for-each select="/meta/relations/mainTable[@tableName=$tableName]/refTable[count(middleTable)=0]">
    List<xsl:value-of select="$charLt"/><xsl:value-of select="str:getTableFormatName(/meta, ./@tableName)" />> body<xsl:if test="position()>1"><xsl:value-of select="position()" /></xsl:if> = null;
	
	public List<xsl:value-of select="$charLt"/><xsl:value-of select="str:getTableFormatName(/meta, ./@tableName)" />> getBody<xsl:if test="position()>1"><xsl:value-of select="position()" /></xsl:if>() {
		return body<xsl:if test="position()>1"><xsl:value-of select="position()" /></xsl:if>;
	}

	public void setBody<xsl:if test="position()>1"><xsl:value-of select="position()" /></xsl:if>(List<xsl:value-of select="$charLt"/><xsl:value-of select="str:getTableFormatName(/meta, ./@tableName)" />> body<xsl:if test="position()>1"><xsl:value-of select="position()" /></xsl:if>) {
		this.body<xsl:if test="position()>1"><xsl:value-of select="position()" /></xsl:if> = body<xsl:if test="position()>1"><xsl:value-of select="position()" /></xsl:if>;
	}
<xsl:result-document href="{$targetFullPath}/{str:getTableFormatName(/meta, ./@tableName)}Vo.java">
		<xsl:value-of select="str:getJavaFileComment($thisFilePathName, $projectName, $authorName)"/>package <xsl:value-of select="$javaPackageName"/>.<xsl:value-of select="$tableDirName"/>.vo;

<xsl:if test="column[@dataType='java.sql.Date']">
import java.sql.Date;
</xsl:if>
		<xsl:if test="column[@dataType='java.sql.Timestamp']">
import java.sql.Timestamp;
</xsl:if>
		<xsl:if test="column[@dataType='java.math.BigDecimal']">
import java.math.BigDecimal;
</xsl:if>

import org.quickbundle.base.vo.RmValueObject;

<xsl:value-of select="str:getClassComment($authorName)"/>
public class <xsl:value-of select="$tableFormatName"/>Vo extends RmValueObject{

    private static final long serialVersionUID = 1;
    //开始vo的属性
    <xsl:apply-templates mode="field"/>        
    //结束vo的属性
        
        
    //开始vo的setter和getter方法
    <xsl:apply-templates mode="method"/>
    //结束vo的setter和getter方法
    
}</xsl:result-document>
</xsl:for-each>

    //开始vo的属性
    <xsl:apply-templates mode="field"/>        
    //结束vo的属性
        
        
    //开始vo的setter和getter方法
    <xsl:apply-templates mode="method"/>
    //结束vo的setter和getter方法
    
}
</xsl:template>
	<!--处理vo属性-->
	<xsl:template match="column" mode="field">
		<xsl:param name="columnName" select="@columnName"/>
		<xsl:param name="columnNameFormat" select="str:filter(@columnName,@filterKeyword,@filterType)"/>
		<xsl:param name="columnNameFormatLower" select="lower-case($columnNameFormat)"/>
	/**
     * <xsl:value-of select="$columnNameFormatLower"/> 表示: <xsl:value-of select="@columnNameDisplay"/>
	 * 数据库注释: <xsl:value-of select="@comment"/>
     */
    private <xsl:choose>
			<xsl:when test="@dataType='java.lang.String'">String <xsl:value-of select="$columnNameFormatLower"/>;</xsl:when>
			<xsl:when test="@dataType='java.sql.Timestamp'">Timestamp <xsl:value-of select="$columnNameFormatLower"/>;</xsl:when>
			<xsl:when test="@dataType='java.sql.Date'">Date <xsl:value-of select="$columnNameFormatLower"/>;</xsl:when>
			<xsl:when test="@dataType='java.math.BigDecimal'">BigDecimal <xsl:value-of select="$columnNameFormatLower"/>;</xsl:when>
			<xsl:when test="@dataType='java.lang.Integer'">int <xsl:value-of select="$columnNameFormatLower"/>;</xsl:when>
			<xsl:otherwise>String <xsl:value-of select="$columnNameFormatLower"/>;</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!--处理vo方法-->
	<xsl:template match="column" mode="method">
		<xsl:param name="columnName" select="@columnName"/>
		<xsl:param name="columnNameFormat" select="str:filter(@columnName,@filterKeyword,@filterType)"/>
		<xsl:param name="columnNameFormatLower" select="lower-case($columnNameFormat)"/>
    /**
     * 获得<xsl:value-of select="@columnNameDisplay"/>
     * <xsl:if test="not(@comment='')">数据库注释: <xsl:value-of select="@comment"/>
		</xsl:if>
     * @return <xsl:value-of select="@columnNameDisplay"/>
     */
	public <xsl:choose>
			<xsl:when test="@dataType='java.lang.String'">String</xsl:when>
			<xsl:when test="@dataType='java.sql.Timestamp'">Timestamp</xsl:when>
			<xsl:when test="@dataType='java.sql.Date'">Date</xsl:when>
			<xsl:when test="@dataType='java.math.BigDecimal'">BigDecimal</xsl:when>
			<xsl:when test="@dataType='java.lang.Integer'">int</xsl:when>
			<xsl:otherwise>String</xsl:otherwise>
		</xsl:choose> get<xsl:value-of select="str:upperFirst($columnNameFormatLower)"/>(){
		return <xsl:value-of select="$columnNameFormatLower"/>;
	}
	
    /**
     * 设置<xsl:value-of select="@columnNameDisplay"/>
     * <xsl:if test="not(@comment='')">数据库注释: <xsl:value-of select="@comment"/>
		</xsl:if>
     * @param <xsl:value-of select="concat($columnNameFormatLower,' ',@columnNameDisplay)"/>
     */
	public void set<xsl:value-of select="str:upperFirst($columnNameFormatLower)"/>(<xsl:choose>
			<xsl:when test="@dataType='java.lang.String'">String</xsl:when>
			<xsl:when test="@dataType='java.sql.Timestamp'">Timestamp</xsl:when>
			<xsl:when test="@dataType='java.sql.Date'">Date</xsl:when>
			<xsl:when test="@dataType='java.math.BigDecimal'">BigDecimal</xsl:when>
			<xsl:when test="@dataType='java.lang.Integer'">int</xsl:when>
			<xsl:otherwise>String</xsl:otherwise>
		</xsl:choose>
		<xsl:value-of select="concat(' ', $columnNameFormatLower)"/>){
		this.<xsl:value-of select="concat($columnNameFormatLower, ' = ', $columnNameFormatLower, ';')"/>
	}
	</xsl:template>
</xsl:stylesheet>
