<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
  <xsl:template match="/UnitsExamCards">
    <html>
      <body style="text-align:center">
        <xsl:for-each select="ExamCard">
          <table width="650px" border="1" cellspacing="0" cellpadding="5" style="page-break-after: always;">
            <tr>
              <td>
                <!--标题-->
                <div style="text-align:center; font-weight:bold; width:100%; margin-top:5px;">
                  <p>
                    <xsl:text>试点高校网络教育部分公共基础课全国统一考试</xsl:text>
                    <br/>
                    <xsl:text>准  考  证</xsl:text>
                  </p>
                </div>
                <!--考生基本信息-->
                <div style="width:100%;margin:10px 0px 0px 0px">
                  <table border="1" cellpadding="2" cellspacing="0" style="font-size:10pt;width:100%;border-collapse:collapse">
                    <tr style="text-align:left;">
                      <td style="font-weight:bold;width:150px">
                        <xsl:text>姓名：</xsl:text>
                      </td>
                      <td>
                        <xsl:value-of select="StudentName"/>
                      </td>
                      <!--照片-->
                      <td rowspan="7" width="120px" align="center">
                        <xsl:element name="img">
                          <xsl:attribute name="width">108px</xsl:attribute>
                          <xsl:attribute name="height">150px</xsl:attribute>
                          <xsl:attribute name="src">
                            <xsl:value-of select="Photo"></xsl:value-of>
                          </xsl:attribute>
                        </xsl:element>
                      </td>
                    </tr>
                    <tr style="text-align:left;">
                      <td style="font-weight:bold">
                        <xsl:text>性别：</xsl:text>
                      </td>
                      <td>
                        <xsl:value-of select="Sex"/>
                      </td>
                    </tr>
                    <tr style="text-align:left;">
                      <td style="font-weight:bold">
                        <xsl:text>准考证号：</xsl:text>
                      </td>
                      <td>
                        <xsl:value-of select="ExamCode"/>
                      </td>
                    </tr>
                    <tr style="text-align:left;">
                      <td style="font-weight:bold">
                        <xsl:text>身份证件名称：</xsl:text>
                      </td>
                      <td>
                        <xsl:value-of select="CertificateName"/>
                      </td>
                    </tr>
                    <tr style="text-align:left;">
                      <td style="font-weight:bold">
                        <xsl:text>身份证件号码：</xsl:text>
                      </td>
                      <td>
                        <xsl:value-of select="CertificateCode"/>
                      </td>
                    </tr>
                    <tr style="text-align:left;">
                      <td style="font-weight:bold">
                        <xsl:text>考点代码：</xsl:text>
                      </td>
                      <td>
                        <xsl:value-of select="ExamUnitCode"/>
                      </td>
                    </tr>
                    <tr style="text-align:left;">
                      <td style="font-weight:bold">
                        <xsl:text>考点名称：</xsl:text>
                      </td>
                      <td>
                        <xsl:value-of select="ExamUnitName"/>
                      </td>
                    </tr>
                  </table>
                </div>
                <!--考试安排-->
                <div style="text-align:center; font-weight:bold; width:100%; margin-top:10px;">
                  <xsl:text>考试安排</xsl:text>
                  <xsl:choose>
                    <xsl:when test="not(Message=null) and not(Message='') and not(Message='0')">
                      <p style="color:red; text-indent:2em; margin-top:25px; text-align:left;">
                        <xsl:value-of select="Message"></xsl:value-of>
                      </p>
                    </xsl:when>
                    <xsl:otherwise>
                      <table border ="1" cellspacing="0" cellpadding="2" style="font-size:10pt;width:100%;text-align:center;border-collapse:collapse">
                        <xsl:if test="ExamArrange/Arrange_WE">
                          <tr>
                            <td colspan="4" style="font-weight :bold;text-align:left">笔试考试</td>
                          </tr>
                          <tr style="background-color:#DADADA">
                            <td width="100">
                              <xsl:text>考试科目</xsl:text>
                            </td>
                            <td>
                              <xsl:text>考试时间</xsl:text>
                            </td>
                            <td>
                              <xsl:text>考场名称</xsl:text>
                            </td>
                            <td>
                              <xsl:text>座位号</xsl:text>
                            </td>
                          </tr>
                          <xsl:for-each select="ExamArrange/Arrange_WE/ExamSubject">
                            <tr>
                              <td>
                                <xsl:value-of select="SubjectName"/>
                              </td>
                              <td>
                                <xsl:value-of select="ExamTime"/>
                              </td>
                              <td>
                                <xsl:value-of select="RoomName"/>
                              </td>
                              <td>
                                <xsl:value-of select="SeatNO"/>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <xsl:text>考场地址</xsl:text>
                              </td>
                              <td colspan="3" style="text-align:left">
                                <xsl:value-of select="ExamSite/Address"/>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <xsl:text>乘车路线</xsl:text>
                              </td>
                              <td colspan="3" style="text-align:left">
                                <xsl:value-of select="ExamSite/Busline"/>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <xsl:text>咨询电话</xsl:text>
                              </td>
                              <td colspan="3" style="text-align:left">
                                <xsl:value-of select="ExamSite/Tel"/>
                              </td>
                            </tr>
                          </xsl:for-each>
                        </xsl:if>
                        <xsl:if test="ExamArrange/Arrange_CE">
                          <tr>
                            <td colspan="4" style="font-weight:bold; text-align:center">机（网）考</td>
                          </tr>
                          <tr style="background-color:#DADADA">
                            <td width="100">
                              <xsl:text>考试科目</xsl:text>
                            </td>
                            <td>
                              <xsl:text>考试时间</xsl:text>
                            </td>
                            <td>
                              <xsl:text>考场名称</xsl:text>
                            </td>
                            <td>
                              <xsl:text>座位号</xsl:text>
                            </td>
                          </tr>
                          <xsl:for-each select="ExamArrange/Arrange_CE/ExamSubject">
                            <tr style="font-weight: normal;">
                              <td>
                                <xsl:value-of select="SubjectName"/>
                              </td>
                              <td>
                                <xsl:value-of select="ExamTime"/>
                              </td>
                              <td>
                                <xsl:value-of select="RoomName"/>
                              </td>
                              <td>
                                <xsl:value-of select="SeatNO"/>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <xsl:text>考场地址</xsl:text>
                              </td>
                              <td colspan="3" style="font-weight: normal; text-align:left">
                                <xsl:value-of select="ExamSite/Address"/>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <xsl:text>乘车路线</xsl:text>
                              </td>
                              <td colspan="3" style="font-weight: normal; text-align:left">
                                <xsl:value-of select="ExamSite/Busline"/>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <xsl:text>咨询电话</xsl:text>
                              </td>
                              <td colspan="3" style="font-weight: normal; text-align:left">
                                <xsl:value-of select="ExamSite/Tel"/>
                              </td>
                            </tr>
                          </xsl:for-each>
                        </xsl:if>
                      </table>
                    </xsl:otherwise>
                  </xsl:choose>
                </div>
                <!--考生须知-->
                <div style="text-align:center; font-weight:bold; margin:10px 0px 0px 0px;">
                  <p style="font-size:12pt; margin:5px 8px 3px 10px;">
                    <xsl:text>考生须知</xsl:text>
                  </p>
                  <p style="font-size:10pt; margin:5px 8px 3px 10px;">本人参加考试，已完整阅读《考生须知》各项内容，并自愿遵守相关规定。</p>
                  <p style="font-size:9pt; margin:5px 8px 3px 10px;">如因疫情影响导致本次统考取消或延期，以 www.cdce.cn 网站发布的通知为准，考生须服从统一安排。</p>
                  <p style="font-size:9pt; margin:5px 8px 3px 10px; text-align:left; font-weight: normal;">
                    <b>1. 本次统考防疫管理相关须知：</b>
                    <br />
                    <b>①参加本次统考的考生，须提前了解并遵守考点所在地防疫要求，配合考点的防疫检查，如测量体温、出示健康码、提供7天内核酸检测结果等。对于不配合测量体温或体温异常、不出示健康码或健康码显示异常及其他不配合考点防疫检查的，考点可拒绝考生进入考场。 到达考点后，因不符合防疫条件无法参加考试的，考生须配合考点做好登记，后续安排见 www.cdce.cn 网站发布的通知。 </b>
                    <br />
                    <b>②应防疫管理工作要求，多数考点禁止外来车辆驶入停放，自驾的考生须自行解决车辆停放问题。 </b>
                    <br />
                    <b>③请考生提前到达考点，为接受考点防疫检查留足时间，避免占用考试时间影响参加考试。</b>
                    <br />
                    <b>④请考生在考前随时关注 www.cdce.cn 网站发布的相关通知。</b>
                    <br />
                    2. 考生须携带统考有效身份证件和准考证参加考试。统考有效身份证件包括：第二代居民身份证，港、澳、台通行证，护照；其中：内地考生只可凭第二代居民身份证参加考试，港、澳、台地区考生可凭港、澳、台通行证或护照，外籍考生可凭护照参加考试；一代居民身份证、户口本、临时身份证、户籍证明、社保卡、医保卡、驾照、军官证和士兵证不属于统考有效身份证件，统考考点不得允许考生参加考试。未携带统考有效身份证件的考生一律不得进入考室。
                    <br />
                    3. 考生到达考点后须配合考点工作人员做好入场验证工作。为严查伪造证件，所有考生经考点工作人员人工核对统考有效证件后，必须刷卡通过身份证签到管理系统验证后方可进入考场。
                    <br />
                    4. 考生须按照考点工作人员要求将携带的物品放在指定位置，已带入考室者，若不按监考教师指定的位置进行存放，对考生按违纪行为处理。各种通讯工具必须关机，并且不得随身携带或者放在考桌上，不服从者按作弊处理。
                    <br />
                    5. 考试开始后，考生方可答卷。考试开始30分钟后，迟到考生不得进入考室。考生在开考30分钟后方可交卷，交卷考生不得在考室附近逗留，不得再返回考室续考。
                    <br />
                    6. 考生参加考试时，如果遇到意外、灾害、停电、服务器、考试机等故障，无法正常考试，应服从监考教师安排，对无理取闹者按照相关规定严肃处理。
                    <br />
                    7. 考生必须服从监考教师的管理，自觉维护考试秩序。考试结束时间一到，须停止答题，提交试卷后立即离场。
                    <br />
                    8. 有考试违纪行为的考生，其相关科目成绩无效；有作弊行为的考生，其当次考试全部科目成绩无效，并视情节严重停考两次；代替他人或由他人代替参加考试的考生，取消其统考资格，同时也不再享有任何相关的免考政策。考试结束后，将在"中国远程教育网"上公布违纪、作弊考生的相关信息。
                    <br />
                    9. 统考考试纪律举报电子邮箱：jubao@mail.open.com.cn。
                  </p>
                </div>
              </td>
            </tr>
          </table>
        </xsl:for-each>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>