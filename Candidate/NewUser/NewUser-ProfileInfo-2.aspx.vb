Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.Web.Script.Services
Imports StayinFront.Engine
Imports System.Net
Imports System.Globalization
Imports System.Object
Imports System.Web.UI
Imports System.Data
Imports System.IO


Partial Public Class ProfileInfo2
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim objFolders As IAeFolders = CType(Master.Master, Portal).SIFSystem.Folders
        Dim objFolder As IAeFolder = objFolders("Prof_ProfileCategory")
        Dim Categories As IAeFolderScan = objFolder.Scan("CatInUse=true and WebEnabled=true and (subcategory.isnull=true or SubCategory=false) and Prof_AppliesTos.Exists(ProfileClass.Classname=""Candidate"")", , , "CatCode")
        If Not Page.IsPostBack Then
            'Set the logged in User
            Dim objUserName As String = Session("Username")
            Dim objCandidate As IAeClassInst = GetInstance(CType(Master.Master, Portal).SIFSystem, "Candidate", False, "Username='" + Session("Username") & "'")
            'Scan and fetch Profile Categories
            If Not objCandidate Is Nothing Then
                Dim visaDate As String = GetValue(objCandidate, "WorkVisaExpiryDate")
                Dim hoursW As String = GetValue(objCandidate, "VisaCondition")
                Dim restrictW As String = GetValue(objCandidate, "WorkVisaComments")
                Dim strHTML As String = ""
                Dim table As New Table()
                Dim i = 0
                Dim existVal As Boolean = False
                For Each category As IAeClassInst In Categories
                    'Add rows, columns and controls into table
                    Dim catCode As String = GetValue(category, "CatCode")
                    strHTML &= "<div id ='category_" & catCode & "'>"
                    If catCode = "B" Or catCode = "C" Or catCode = "D" Or catCode = "E" Or catCode = "X" Then
                        strHTML &= "<h2 class='h2-17 tooltipWorkContact'>" & GetValue(category, "WebText") & " <img src='../img/info-sign.svg' alt='&#8594'/><span class='tooltiptext'>Multiple selection is allowed</span></h2>"
                    Else
                        strHTML &= "<h2 class='h2-17'>" & GetValue(category, "WebText") & "</h2>"
                    End If
                    strHTML &= "<div class='cell-info'>"
                    strHTML &= "<div class='radio-input-grid'>"
                    strHTML &= "<div class='radio-input-grid__row'>"
                    Dim CategoryValues As IAeFolder = category.Folders("Prof_ActiveProfileValues")
                    For Each categoryvalue As IAeClassInst In CategoryValues
                        strHTML &= "<div id='ProfileGroup' class='radio-input-grid__column'> "
                        Dim controlType As String = GetValue(categoryvalue, "ProfileCategory.Type")
                        If Not controlType Is Nothing Then
                            'define control type is RadioButton or CheckBox
                            If controlType = "Radio" Then
                                strHTML &= "<input type='radio' value=" & categoryvalue.Key & " name=" & GetValue(categoryvalue, "ProfileCategory.CatCode") & i & " id=" & categoryvalue.Key & " class='radio-check'"
                                Dim CandidateProfileValues As IAeFolder = objCandidate.Folders("CandidateProfiles")
                                For Each candidateprofilevalue As IAeClassInst In CandidateProfileValues
                                    If candidateprofilevalue.Members("profilevalue").Key = categoryvalue.Key Then
                                        existVal = True
                                        strHTML &= "checked='checked'"
                                        Exit For
                                    End If
                                Next
                                strHTML &= "/>"
                                strHTML &= "<label class='centerLabel' for=" & categoryvalue.Key & "> " & categoryvalue.Prompt & " </label>"

                            Else
                                'checkbox
                                strHTML &= "<input type='checkbox' value=" & categoryvalue.Key & " name=" & GetValue(categoryvalue, "ProfileCategory.CatCode") & i & " id=" & categoryvalue.Key & " class='radio-check'"
                                Dim CandidateProfileValues As IAeFolder = objCandidate.Folders("CandidateProfiles")
                                For Each candidateprofilevalue As IAeClassInst In CandidateProfileValues
                                    If candidateprofilevalue.Members("profilevalue").Key = categoryvalue.Key Then
                                        strHTML &= "checked='checked'"
                                        existVal = True
                                        Exit For
                                    End If
                                Next
                                strHTML &= "/>"
                                strHTML &= "<label class='centerLabel' for=" & categoryvalue.Key & "> " & categoryvalue.Prompt & " </label>"
                            End If
                        End If
                        strHTML &= "</div>"
                        If categoryvalue.Key = "{843DC134-49CC-4AF5-9176-C2E3161982F6}" Then
                            strHTML &= "<br/>"
                            strHTML &= "<div class='visa-cond m-b1' style=''><br/><h4>Please specify the following details if you know them</h4>"
                            strHTML &= "<div class='layout layout--middle'>"
                            strHTML &= "<div class='layout__item sm-1of2 '>"
                            strHTML &= "<div class='layout__item w floatLeft'>"
                            strHTML &= "<label class='a--pseudo req' for='currAgen'>Current Visa Expiry Date</label>"

                            strHTML &= "<input name='expDate' id='expDate' class='datepicker inp--width' type='teext' value='" & visaDate & "'>"
                            strHTML &= "</div>"
                            strHTML &= "</div>"
                            strHTML &= "<div class='layout__item sm-1of2 fr'>"
                            strHTML &= "<div class='layout__item w '>"
                            strHTML &= "<label class='a--pseudo req' for='workHour'>Number of hours per week allowed to work</label>"

                            strHTML &= "<select name='workHour' id='workHour' class='inp--width' ><option value=''></option><option value='20'>20</option><option value='40'>40</option></select>"

                            'strHTML &= "<input name='workHour' id='workHour' class='inp--width' type='number' value='" & hoursW & "'>"
                            strHTML &= "</div>"
                            strHTML &= "</div>"
                            strHTML &= "</div>"

                            strHTML &= "<label class=' req'> Any Restriction of who or where can you work</label>"
                            strHTML &= "<input name='restrictions' id='restrictions' class='inp--width' type='text' value='" & restrictW & "'>"
                            strHTML &= "</div>"
                        End If
                    Next
                    strHTML &= "</div>"
                    strHTML &= "</div>"
                    strHTML &= "</div>"
                    strHTML &= "</div>"
                    strHTML &= "<input type='hidden' name=category" & i & " value=" & category.Key & "> "

                    i = i + 1
                Next
                exist.Value = GetValue(objCandidate, "IsDirectCandidate")
                CandProfiles.Text = strHTML
                isNewUser.Value = GetValue(objCandidate, "isNewUser")
                Hours.Value = GetValue(objCandidate, hoursW)
                IsDirect.Value = GetValue(objCandidate, "IsDirectCandidate")
                UserCounter.Value = GetValue(objCandidate, "OnlineRegCounter")
            End If
        End If
    End Sub
    <WebMethod()> Public Shared Function SaveVisa_Click(ByVal key As String, ByVal expDate As String, ByVal restrictions As String, ByVal hours As String) As String
        Try
            Dim objSystem As New AeSystem
            objSystem.EnableDebugging()
            objSystem.Connect("alpha-svr02", "Omega", "system", "")
            HttpContext.Current.Session("SIFSystem") = objSystem
            Dim objCandidate As IAeClassInst = GetInstance(objSystem, "Candidate", False, "Username='" + key + "'")
            Dim objTransaction As IAeTransaction = objSystem.BeginTransaction
            SetValue(objCandidate, "VisaCondition", hours)
            SetValue(objCandidate, "WorkVisaComments", restrictions)
            SetValue(objCandidate, "WorkVisaExpiryDate", expDate)
            objCandidate.Save(objTransaction)
            objTransaction.Commit()
            objTransaction = Nothing

            Return 1
        Catch ex As Exception
            Return ex.Message
        End Try
    End Function

    Protected Sub next_btn_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim objUserName As String = Session("Username")
        Dim objCandidate As IAeClassInst = GetInstance(CType(Master.Master, Portal).SIFSystem, "Candidate", False, "Username='" + Session("Username") & "'")
        saved = False
        Dim objValidate As IAeValidate = Nothing
        Dim objTransaction As IAeTransaction = CType(Master.Master, Portal).SIFSystem.BeginTransaction

        Dim objFolders As IAeFolders = CType(Master.Master, Portal).SIFSystem.Folders
        Dim objFolder As IAeFolder = objFolders("Prof_ProfileCategory")
        Dim Categories As IAeFolderScan = objFolder.Scan("CatInUse=true and WebEnabled=true and (subcategory.isnull=true or SubCategory=false) and Prof_AppliesTos.Exists(ProfileClass.Classname=""Candidate"")", , , "CatCode")
        Dim candidateprofilevalues = objCandidate.Folders("CandidateProfiles")
        Dim intCategoryCount = objFolder.Count("CatInUse=true and WebEnabled=true and (subcategory.isnull=true or SubCategory=false) and Prof_AppliesTos.Exists(ProfileClass.Classname=""Candidate"")")

        If Not objCandidate Is Nothing Then
            Dim counter = GetValue(objCandidate, "OnlineRegCounter")
            If counter Is Nothing Then
                counter = 3
            Else
                counter = GetValue(objCandidate, "OnlineRegCounter")
                Dim CounterInt As Integer = Convert.ToInt32(Convert.ToDecimal(counter))
                If CounterInt < 3 Then
                    counter = 3
                End If
            End If
            SetValue(objCandidate, "OnlineRegCounter", counter)
            For Each candidateprofilevalue In objCandidate.Folders("CandidateProfiles").Scan("ProfileCategory.WebEnabled=true and (ProfileCategory.subcategory.isnull=true or ProfileCategory.SubCategory=false)")
                Dim valuetodelete = candidateprofilevalue.Key.ToString
                Dim deletecandidateprofilevalue = CType(Master.Master, Portal).SIFSystem.Classes("candidateprofile").GetInstance(valuetodelete)
                deletecandidateprofilevalue.Delete()
            Next

            For i = 0 To (intCategoryCount - 1)
                Dim currentvalue As Array
                For Each category As IAeClassInst In Categories
                    Dim CategoryValues As IAeFolder = category.Folders("Prof_ActiveProfileValues")
                    For Each categoryvalue As IAeClassInst In CategoryValues
                        Dim currentcategory = Request.Form("category" & i)
                        currentvalue = Split(Request.Form(GetValue(categoryvalue, "ProfileCategory.CatCode") & i), ",")
                        For j = 0 To UBound(currentvalue)
                            If currentvalue(j) > "" Then
                                currentvalue(j) = Replace(currentvalue(j), " ", "")
                                Dim newprofilevalue = CType(Master.Master, Portal).SIFSystem.Classes("prof_profilevalue").GetInstance(currentvalue(j))
                                Dim newprofilecategory = CType(Master.Master, Portal).SIFSystem.Classes("prof_profilecategory").GetInstance(newprofilevalue.profilecategory.key)
                                Dim newcandidateprofilevalue As IAeClassInst = candidateprofilevalues.CreateNewInstance

                                SetJoinValue(newprofilevalue.Key.ToString(), newcandidateprofilevalue, "profilevalue")
                                SetJoinValue(newprofilecategory.Key.ToString(), newcandidateprofilevalue, "profilecategory")
                                SetJoinValue(objCandidate.Key.ToString(), newcandidateprofilevalue, "candidate")
                                newcandidateprofilevalue.Save()
                            End If
                        Next
                        Exit For
                    Next
                    Exit For
                Next
            Next
            'SetValue("WorkVisaExpiryDate", expDate.Text)

            objCandidate.Save(objTransaction)
            objValidate = objTransaction.Validate
            'validate before commit
            If objValidate.Status <> 3 Then
                objTransaction.Commit()
                saved = True
                Response.Redirect("~/NewUser/NewUser-ProfileInfo-3.aspx")
            Else
                'lblMessage.Text = objValidate.Result.Message
                objTransaction = Nothing
                saved = False
            End If
            objTransaction = Nothing
        End If
    End Sub
End Class
