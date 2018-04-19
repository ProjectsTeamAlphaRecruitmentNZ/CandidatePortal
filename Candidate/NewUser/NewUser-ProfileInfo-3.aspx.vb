Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.Web.Script.Services
Imports StayinFront.Engine
Imports System.Net
Imports System.Globalization
Imports System.Object
Imports System.Web.UI

Partial Public Class ProfileInfo3
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim objFolders As IAeFolders = CType(Master.Master, Portal).SIFSystem.Folders
        Dim objFolder As IAeFolder = objFolders("Prof_ProfileCategory")
        Dim Categories As IAeFolderScan = objFolder.Scan("CatInUse=true and WebEnabled=true and SubCategory=true and Prof_AppliesTos.Exists(ProfileClass.Classname=""Candidate"")", , , "CatCode")
        If Not Page.IsPostBack Then
            'Set the logged in User
            Dim objUserName As String = Session("Username")
            Dim objCandidate As IAeClassInst = GetInstance(CType(Master.Master, Portal).SIFSystem, "Candidate", False, "Username='" + Session("Username") & "'")
            'Scan and fetch Profile Categories
            If Not objCandidate Is Nothing Then

                Dim existVal As Boolean = False

                'Display Values
                Dim subCategories As IAeFolderScan = objFolder.Scan("CatInUse=true and WebEnabled=true and SubCategory=true and Prof_AppliesTos.Exists(ProfileClass.Classname=""Candidate"")", , , "CatCode")
                Dim strHTML1 As String = ""
                Dim j = 0
                For Each subCategory As IAeClassInst In subCategories
                    strHTML1 &= "<div class='dropMenu' id=' " & j & "'>"
                    strHTML1 &= "<div class='dropMenu--header'>"
                    strHTML1 &= "<h2 class='h2-17 display-inline'>" & GetValue(subCategory, "WebText") & "</h2>"
                    strHTML1 &= "<div class='plusMinusContainer'><img src='../img/angle-arrow-down.svg' class='img-dropMenu rotate' id='img" & j & "'></div>"
                    strHTML1 &= "</div>"
                    strHTML1 &= "<div class='cell-info details'>"
                    strHTML1 &= "<div class='radio-input-grid'>"
                    strHTML1 &= "<div class='radio-input-grid__row'>"
                    Dim CategoryValues As IAeFolder = subCategory.Folders("Prof_ActiveProfileValues")
                    For Each categoryvalue As IAeClassInst In CategoryValues
                        'Add rows, columns and controls into table
                        strHTML1 &= "<div class='radio-input-grid__column'> "
                        strHTML1 &= "<input type='checkbox' value=" & categoryvalue.Key & " name=" & GetValue(categoryvalue, "ProfileCategory.CatCode") & j & " id=" & categoryvalue.Key & " class='radio-check'"
                        Dim CandidateProfileValues As IAeFolder = objCandidate.Folders("CandidateProfiles")
                        For Each candidateprofilevalue As IAeClassInst In CandidateProfileValues
                            If candidateprofilevalue.Members("profilevalue").Key = categoryvalue.Key Then
                                strHTML1 &= "checked='checked'"
                                existVal = True
                                Exit For
                            End If
                        Next
                        strHTML1 &= "/>"
                        strHTML1 &= "<label class='centerLabel' for=" & categoryvalue.Key & " class = 'hiddenOverflow'> " & categoryvalue.Prompt & " </label>"
                        strHTML1 &= "</div>"
                    Next
                    strHTML1 &= "</div>"
                    strHTML1 &= "</div>"
                    strHTML1 &= "</div>"
                    strHTML1 &= "</div>"
                    j = j + 1
                Next
                exist.Value = GetValue(objCandidate, "IsDirectCandidate")
                candValues.Text = strHTML1
                IsDirect.Value = GetValue(objCandidate, "IsDirectCandidate")

                isNewUser.Value = GetValue(objCandidate, "isNewUser")
                UserCounter.Value = GetValue(objCandidate, "OnlineRegCounter")
            End If
        End If
    End Sub

    Protected Sub next_btn_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim objUserName As String = Session("Username")
        Dim objCandidate As IAeClassInst = GetInstance(CType(Master.Master, Portal).SIFSystem, "Candidate", False, "Username='" + Session("Username") & "'")
        saved = False
        Dim objValidate As IAeValidate = Nothing
        Dim objTransaction As IAeTransaction = CType(Master.Master, Portal).SIFSystem.BeginTransaction

        Dim objFolders As IAeFolders = CType(Master.Master, Portal).SIFSystem.Folders
        Dim objFolder As IAeFolder = objFolders("Prof_ProfileCategory")
        Dim Categories As IAeFolderScan = objFolder.Scan("CatInUse=true and WebEnabled=true and SubCategory=true and Prof_AppliesTos.Exists(ProfileClass.Classname=""Candidate"")", , , "CatCode")
        Dim candidateprofilevalues = objCandidate.Folders("CandidateProfiles")
        Dim intCategoryCount = objFolder.Count("CatInUse=true and WebEnabled=true and SubCategory=true and Prof_AppliesTos.Exists(ProfileClass.Classname=""Candidate"")")

        If Not objCandidate Is Nothing Then
            Dim counter = GetValue(objCandidate, "OnlineRegCounter")
            If counter Is Nothing Then
                counter = 4
            Else
                counter = GetValue(objCandidate, "OnlineRegCounter")
                Dim CounterInt As Integer = Convert.ToInt32(Convert.ToDecimal(counter))
                If CounterInt < 4 Then
                    counter = 4
                End If
            End If
            SetValue(objCandidate, "OnlineRegCounter", counter)
            For Each candidateprofilevalue In objCandidate.Folders("CandidateProfiles").Scan("ProfileCategory.WebEnabled=true and ProfileCategory.SubCategory=true")
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

            objCandidate.Save(objTransaction)
            objValidate = objTransaction.Validate
            'validate before commit
            If objValidate.Status <> 3 Then
                objTransaction.Commit()
                saved = True
                Response.Redirect("~/NewUser/NewUser-ProfileInfo-4.aspx")
            Else
                'lblMessage.Text = objValidate.Result.Message
                objTransaction = Nothing
                saved = False
            End If
            objTransaction = Nothing
        End If
    End Sub
End Class