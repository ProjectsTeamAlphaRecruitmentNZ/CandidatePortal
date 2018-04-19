Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.Web.Script.Services
Imports StayinFront.Engine
Imports System.Net
Imports System.Globalization
Imports System.Object
Imports System.Web.UI
Imports System.IO

Partial Public Class NewUserMaster
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Username") Is Nothing Then
            Response.Redirect("http://www.alphaonline.co.nz/JobsOnline/candidatelogin/login.aspx?domain=JobOnline-Candidate&OriginalURL=%2Fjobsonline%2Fcandidate&Retry=0&Timeout=0&Lockout=0")
        End If
        If Session("Username").ToString() = "" Then
            Response.Redirect("http://www.alphaonline.co.nz/JobsOnline/candidatelogin/login.aspx?domain=JobOnline-Candidate&OriginalURL=%2Fjobsonline%2Fcandidate&Retry=0&Timeout=1&Lockout=0")
        End If
    End Sub

    Sub Logout_Click(ByVal sender As Object, ByVal e As EventArgs)
        Session("Username") = Nothing
        Response.Redirect("http://www.alphaonline.co.nz/JobsOnline/candidatelogin/login.aspx?domain=JobOnline-Candidate&OriginalURL=%2Fjobsonline%2Fcandidate")
    End Sub

    Sub ChangePage_Click(sender As Object, e As EventArgs)
        Dim anchor As HtmlAnchor = sender
        Dim currentURL As String = HttpContext.Current.Request.Url.AbsolutePath.ToString

        Dim objUserName As String = Session("Username")
        Dim objCandidate As IAeClassInst = GetInstance(SIFCon1.TheSystem.This, "Candidate", False, "Username='" + Session("Username") & "'")
        saved = False
        Dim objValidate As IAeValidate = Nothing
        Dim objTransaction As IAeTransaction = SIFCon1.TheSystem.This.BeginTransaction
        If Not objCandidate Is Nothing Then
            If currentURL = "/JobsOnline/Candidate/NewUser/NewUser-ProfileInfo-4.aspx" Then
                Dim objFolders As IAeFolders = SIFCon1.TheSystem.This.Folders
                Dim objFolder As IAeFolder = objFolders("SkillGroup")
                Dim skillgroups As IAeFolder = objFolder
                Dim candidateskills = objCandidate.Folders("candidateskills")
                Dim intSkillCount = objFolders("SkillGroup").Count
                For Each candidateskill In objCandidate.Folders("candidateskills")
                    Dim valuetodelete = candidateskill.Key.ToString
                    Dim deletecandidateprofilevalue = SIFCon1.TheSystem.This.Classes("CandidateSkill").GetInstance(valuetodelete)
                    deletecandidateprofilevalue.Delete()
                Next
                For i = 0 To (intSkillCount - 1)
                    Dim currentvalue As Array
                    For Each category As IAeClassInst In skillgroups
                        Dim CategoryValues As IAeFolder = category.Folders("Skills")
                        For Each categoryvalue As IAeClassInst In CategoryValues
                            currentvalue = Split(Request.Form("skill" & i), ",")
                            For j = 0 To UBound(currentvalue)
                                If currentvalue(j) > "" Then
                                    currentvalue(j) = Replace(currentvalue(j), " ", "")
                                    Dim newskill = SIFCon1.TheSystem.This.Classes("Skill").GetInstance(currentvalue(j))
                                    Dim newcandidateskill As IAeClassInst = candidateskills.CreateNewInstance
                                    SetJoinValue(newskill.Key.ToString(), newcandidateskill, "Skill")
                                    SetJoinValue(objCandidate.Key.ToString(), newcandidateskill, "candidate")
                                    newcandidateskill.Save(objTransaction)
                                    newcandidateskill = Nothing
                                End If
                            Next
                            Exit For
                        Next
                        Exit For
                    Next
                Next
            ElseIf currentURL = "/JobsOnline/Candidate/NewUser/NewUser-ProfileInfo-2.aspx" Then

                Dim objFolders As IAeFolders = SIFCon1.TheSystem.This.Folders
                Dim objFolder As IAeFolder = objFolders("Prof_ProfileCategory")
                Dim Categories As IAeFolderScan = objFolder.Scan("CatInUse=true and WebEnabled=true and (subcategory.isnull=true or SubCategory=false) and Prof_AppliesTos.Exists(ProfileClass.Classname=""Candidate"")", , , "CatCode")
                Dim candidateprofilevalues = objCandidate.Folders("CandidateProfiles")
                Dim intCategoryCount = objFolder.Count("CatInUse=true and WebEnabled=true and (subcategory.isnull=true or SubCategory=false) and Prof_AppliesTos.Exists(ProfileClass.Classname=""Candidate"")")
                For Each candidateprofilevalue In objCandidate.Folders("CandidateProfiles").Scan("ProfileCategory.WebEnabled=true and (ProfileCategory.subcategory.isnull=true or ProfileCategory.SubCategory=false)")
                    Dim valuetodelete = candidateprofilevalue.Key.ToString
                    Dim deletecandidateprofilevalue = SIFCon1.TheSystem.This.Classes("candidateprofile").GetInstance(valuetodelete)
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
                                    Dim newprofilevalue = SIFCon1.TheSystem.This.Classes("prof_profilevalue").GetInstance(currentvalue(j))
                                    Dim newprofilecategory = SIFCon1.TheSystem.This.Classes("prof_profilecategory").GetInstance(newprofilevalue.profilecategory.key)
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
            ElseIf currentURL = "/JobsOnline/Candidate/NewUser/NewUser-ProfileInfo-3.aspx" Then
                Dim objFolders As IAeFolders = SIFCon1.TheSystem.This.Folders
                Dim objFolder As IAeFolder = objFolders("Prof_ProfileCategory")
                Dim Categories As IAeFolderScan = objFolder.Scan("CatInUse=true and WebEnabled=true and SubCategory=true and Prof_AppliesTos.Exists(ProfileClass.Classname=""Candidate"")", , , "CatCode")
                Dim candidateprofilevalues = objCandidate.Folders("CandidateProfiles")
                Dim intCategoryCount = objFolder.Count("CatInUse=true and WebEnabled=true and SubCategory=true and Prof_AppliesTos.Exists(ProfileClass.Classname=""Candidate"")")

                For Each candidateprofilevalue In objCandidate.Folders("CandidateProfiles").Scan("ProfileCategory.WebEnabled=true and ProfileCategory.SubCategory=true")
                    Dim valuetodelete = candidateprofilevalue.Key.ToString
                    Dim deletecandidateprofilevalue = SIFCon1.TheSystem.This.Classes("candidateprofile").GetInstance(valuetodelete)
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
                                    Dim newprofilevalue = SIFCon1.TheSystem.This.Classes("prof_profilevalue").GetInstance(currentvalue(j))
                                    Dim newprofilecategory = SIFCon1.TheSystem.This.Classes("prof_profilecategory").GetInstance(newprofilevalue.profilecategory.key)
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
            ElseIf currentURL = "/JobsOnline/Candidate/NewUser/NewUser-ProfileInfo-1.aspx" Then

                Dim first_name As TextBox = NewUserContent.FindControl("first_name")
                If first_name IsNot Nothing Then
                    SetValue(objCandidate, "Name.Firstname", first_name.Text)
                End If
                Dim middle_name As TextBox = NewUserContent.FindControl("middle_name")
                If middle_name IsNot Nothing Then
                    SetValue(objCandidate, "Name.MiddleName", middle_name.Text)
                End If
                Dim last_name As TextBox = NewUserContent.FindControl("last_name")
                If last_name IsNot Nothing Then
                    SetValue(objCandidate, "Name.LastName", last_name.Text)
                End If
                Dim phone_l As TextBox = NewUserContent.FindControl("phone_l")
                Dim phoneL As String = phone_l.Text

                If phoneL IsNot Nothing Then
                    phoneL = phoneL.Trim()
                    If InStr(phoneL, " ") > 0 Then
                        Dim pLS As String() = phoneL.Split(" ")
                        SetValue(objCandidate, "Phone.AreaCode", pLS(0))
                        SetValue(objCandidate, "Phone.Number", pLS(1))
                    Else
                        SetValue(objCandidate, "Phone.AreaCode", Nothing)
                        SetValue(objCandidate, "Phone.Number", phoneL)
                    End If
                End If


                Dim phone_m As TextBox = NewUserContent.FindControl("phone_m")
                    If phone_m IsNot Nothing Then
                        Dim phoneM As String = phone_m.Text
                        phoneM = phoneM.Trim()
                        If InStr(phoneM, " ") > 0 Then
                            Dim pMS As String() = phoneM.Split(" ")
                            SetValue(objCandidate, "Mobile.AreaCode", pMS(0))
                            SetValue(objCandidate, "Mobile.Number", pMS(1))
                        Else
                            SetValue(objCandidate, "Mobile.AreaCode", Nothing)
                            SetValue(objCandidate, "Mobile.Number", phoneM)
                        End If
                    End If

                    Dim email As TextBox = NewUserContent.FindControl("email")
                    If email IsNot Nothing Then
                        SetValue(objCandidate, "Emailaddress.Emailaddress", email.Text)
                    End If
                    Dim w_email As TextBox = NewUserContent.FindControl("w_email")
                    If w_email IsNot Nothing Then
                        SetValue(objCandidate, "WorkeMailAddress.Emailaddress", w_email.Text)
                    End If
                    Dim birthday As HtmlInputText = NewUserContent.FindControl("birthday")
                    If birthday IsNot Nothing Then
                        Dim dob() As String = birthday.Value.Split("/")
                        SetValue(objCandidate, "DOB.DateDay", dob(0))
                        SetValue(objCandidate, "DOB.DateMonth", dob(1))
                        SetValue(objCandidate, "DOB.DateYear", dob(2))
                    End If

                    Dim address As TextBox = NewUserContent.FindControl("address")
                    Dim suburb As TextBox = NewUserContent.FindControl("suburb")
                    If address IsNot Nothing Then
                        SetValue(objCandidate, "Address.Address", address.Text)
                        If suburb IsNot Nothing Then
                            SetValue(objCandidate, "Address.Address", address.Text)
                            SetValue(objCandidate, "Address.Suburb", suburb.Text)
                        End If
                    End If
                    Dim city As TextBox = NewUserContent.FindControl("city")
                    If city IsNot Nothing Then
                        SetValue(objCandidate, "Address.City", city.Text)
                    End If
                    Dim postCode As TextBox = NewUserContent.FindControl("postCode")
                    If postCode IsNot Nothing Then
                        SetValue(objCandidate, "Address.PostCode", postCode.Text)
                    End If

                    Dim ddlCountry As DropDownList = NewUserContent.FindControl("ddlCountry")
                    If ddlCountry IsNot Nothing Then
                        Dim strCtryKey = GetInstance(SIFCon1.TheSystem.This, "Countries", False, "Name='" + ddlCountry.SelectedValue & "'").Key
                        SetValue(objCandidate, "Address.country", strCtryKey)
                    End If

                    Dim birthPlace As TextBox = NewUserContent.FindControl("birthPlace")
                    If birthPlace IsNot Nothing Then
                        SetValue(objCandidate, "CandidatePlaceOfBirth", birthPlace.Text)
                    End If
                    Dim linkedin As TextBox = NewUserContent.FindControl("linkedin")
                    If linkedin IsNot Nothing Then
                        SetValue(objCandidate, "LinkedInPage.wwwAddress", linkedin.Text)
                    End If
                    Dim skype_name As TextBox = NewUserContent.FindControl("skype_name")
                    If skype_name IsNot Nothing Then
                        SetValue(objCandidate, "SkypeName", skype_name.Text)
                    End If
                    Dim Gender As DropDownList = NewUserContent.FindControl("Gender")
                    If Not Gender.SelectedValue <> "" Or Gender.SelectedValue = Nothing Then

                    Else
                        SetValue(objCandidate, "CandidateGender", Gender.SelectedValue)
                    End If

                    Dim driving As CheckBox = NewUserContent.FindControl("driving")
                    If driving IsNot Nothing Then
                        SetValue(objCandidate, "CandidateDriversLicense", driving.Checked)
                    End If
                    Dim ownTransport As CheckBox = NewUserContent.FindControl("ownTransport")
                    If ownTransport IsNot Nothing Then
                        SetValue(objCandidate, "CandidateOwnTransport", ownTransport.Checked)
                    End If
                    Dim smoker As CheckBox = NewUserContent.FindControl("smoker")
                    If smoker IsNot Nothing Then
                        SetValue(objCandidate, "CandidateSmoker", smoker.Checked)
                    End If

                    Dim availability As TextBox = NewUserContent.FindControl("availability")
                    If availability IsNot Nothing Then
                        SetValue(objCandidate, "CandidateAvailability", availability.Text)
                    End If
                    Dim alt_first_name As TextBox = NewUserContent.FindControl("alt_first_name")
                    If alt_first_name IsNot Nothing Then
                        SetValue(objCandidate, "AlternateContact.Name.FirstName", alt_first_name.Text)
                    End If
                    Dim alt_last_name As TextBox = NewUserContent.FindControl("alt_last_name")
                    If alt_last_name IsNot Nothing Then
                        SetValue(objCandidate, "AlternateContact.Name.LastName", alt_last_name.Text)
                    End If
                    Dim alt_phone_l As TextBox = NewUserContent.FindControl("alt_phone_l")
                    If alt_phone_l IsNot Nothing Then
                        Dim phoneAL As String = alt_phone_l.Text
                    If InStr(phoneAL, " ") > 0 Then
                        Dim pLS As String() = phoneAL.Trim().Split(" ")
                        SetValue(objCandidate, "AlternateContact.PhoneNumber.AreaCode", pLS(0))
                        SetValue(objCandidate, "AlternateContact.PhoneNumber.Number", pLS(1))
                    Else
                        SetValue(objCandidate, "AlternateContact.PhoneNumber.AreaCode", Nothing)
                        SetValue(objCandidate, "AlternateContact.PhoneNumber.Number", phoneAL)
                        End If
                    End If
                    Dim alt_email As TextBox = NewUserContent.FindControl("alt_email")
                    If alt_email IsNot Nothing Then
                        SetValue(objCandidate, "AlternateContact.Email.eMailAddress", alt_email.Text)
                    End If
                    Dim alt_rel As TextBox = NewUserContent.FindControl("alt_rel")
                    If alt_rel IsNot Nothing Then
                        SetValue(objCandidate, "AlternateContact.Relationship", alt_rel.Text)
                    End If
                ' Dim w_phone As TextBox = NewUserContent.FindControl("w_phone")
                'If w_phone IsNot Nothing Then
                '    Dim phoneAWL As String = w_phone.Text
                '    If InStr(phoneAWL, " ") > 0 Then
                '        Dim pLS As String() = phoneAWL.Trim().Split(" ")
                '        SetValue(objCandidate, "AlternateContact.PhoneNumber.AreaCode", pLS(0))
                '        SetValue(objCandidate, "AlternateContact.PhoneNumber.Number", pLS(1))
                '    Else
                '        SetValue(objCandidate, "AlternateContact.PhoneNumber.AreaCode", Nothing)
                '        SetValue(objCandidate, "AlternateContact.PhoneNumber.Number", phoneAWL)
                '    End If
                'End If
                'Dim w_email As TextBox = NewUserContent.FindControl("w_email")
                'If w_email IsNot Nothing Then
                '    SetValue(objCandidate, "WorkeMailAddress.eMailAddress", w_email.Text)
                'End If
                Dim currEmp As TextBox = NewUserContent.FindControl("currEmp")
                If currEmp IsNot Nothing Then
                        SetValue(objCandidate, "CandidateCurrentEmployer", currEmp.Text)
                    End If
                    Dim currPos As TextBox = NewUserContent.FindControl("currPos")
                    If currPos IsNot Nothing Then
                        SetValue(objCandidate, "CandidateCurrentPosition", currPos.Text)
                    End If
                    Dim currSal As TextBox = NewUserContent.FindControl("currSal")
                    If currSal IsNot Nothing Then
                        SetValue(objCandidate, "CandidateCurrentSalary", currSal.Text)
                    End If
                    Dim sal_sought As TextBox = NewUserContent.FindControl("sal_sought")
                    If sal_sought IsNot Nothing Then
                        SetValue(objCandidate, "CandidateSalarySought", sal_sought.Text)
                    End If
                    Dim notice_time_perm As TextBox = NewUserContent.FindControl("notice_time_perm")
                    If notice_time_perm IsNot Nothing Then
                        SetValue(objCandidate, "CandidateNoticePeriod_Perm", notice_time_perm.Text)
                    End If
                    Dim currAgen As TextBox = NewUserContent.FindControl("currAgen")
                    If currAgen IsNot Nothing Then
                        SetValue(objCandidate, "CandidateRegisteredAgencies", currAgen.Text)
                    End If

                    Dim temp_sought As TextBox = NewUserContent.FindControl("temp_sought")
                    If temp_sought IsNot Nothing Then
                        SetValue(objCandidate, "CandidateRateSought", temp_sought.Text)
                    End If

                    Dim current_work_at As TextBox = NewUserContent.FindControl("current_work_at")
                    If current_work_at IsNot Nothing Then
                        SetValue(objCandidate, "CandidateCurrentTempEmployer", current_work_at.Text)
                    End If
                    Dim notice_time As TextBox = NewUserContent.FindControl("notice_time")
                    If notice_time IsNot Nothing Then
                        SetValue(objCandidate, "CandidateNoticePeriod", notice_time.Text)
                    End If


                    Dim photoUpload As FileUpload = NewUserContent.FindControl("photoUpload")
                    Dim lblPhotoUpload As Label = NewUserContent.FindControl("lblPhotoUpload")
                    If photoUpload IsNot Nothing Then
                        '----Upload Photo
                        If photoUpload.PostedFile Is Nothing OrElse String.IsNullOrEmpty(photoUpload.PostedFile.FileName) OrElse photoUpload.PostedFile.InputStream Is Nothing Then
                        Else
                            Dim extension1 As String = System.IO.Path.GetExtension(photoUpload.PostedFile.FileName).ToLower()
                            Dim mimeType1 As String = Nothing
                            Select Case extension1
                                Case ".jpeg"
                                    mimeType1 = "image/jpeg"
                                Case ".jpg"
                                    mimeType1 = "image/jpg"
                                Case ".bmp"
                                    mimeType1 = "image/bmp"
                                Case ".png"
                                    mimeType1 = "image/png"
                                Case ".tiff"
                                    mimeType1 = "image/tiff"
                                Case Else
                                    'Invalid File type upload
                                    lblPhotoUpload.Text = "Not a valid file format. File extensions allowed: .jpg, .jpeg, .png, .bmp, .tiff"
                                    Exit Sub
                            End Select
                            Dim savePath As String = "C:\inetpub\wwwroot\savefiles\"
                            If photoUpload.HasFile Then

                                savePath += photoUpload.FileName
                                photoUpload.SaveAs(savePath)
                                lblPhotoUpload.Text = "Your file was uploaded successfully."

                                Dim objMimeDocument As New Elk9Utils.MimeDocument
                                objMimeDocument.LoadFromFile(savePath, False)

                                Dim objDoc As IAeClassInst
                                objDoc = objCandidate.Folders("Documents").CreateNewInstance
                                SetValue(objDoc, "MimeType", photoUpload.PostedFile.ContentType)
                                SetValue(objDoc, "Name", photoUpload.PostedFile.FileName)
                                SetValue(objDoc, "FileSize", My.Computer.FileSystem.GetFileInfo(savePath).Length / 1024)
                                SetValue(objDoc, "DocumentDescription", photoUpload.PostedFile.FileName)
                                SetValue(objDoc, "CandidatePhoto", True)
                                SetValue(objDoc, "Compressed", True)
                                SetValue(objDoc, "Content", objMimeDocument.GetContent(True))
                                SetValue(objDoc, "VisibleOnWeb", True)
                                objDoc.Save()
                                objCandidate.Save()
                            Else
                                lblPhotoUpload.Text = "You did not specify a file to upload."
                            End If

                            Dim file1 As FileInfo = New FileInfo(savePath)
                            If file1.Exists Then
                                file1.Delete()
                            End If
                        End If
                    End If


                ElseIf currentURL = "/JobsOnline/Candidate/NewUser/NewUser-ProfileInfo-5.aspx" Then
                    Dim med_cond_list As RadioButtonList = NewUserContent.FindControl("med_cond_list")
                If med_cond_list IsNot Nothing Then
                    If med_cond_list.SelectedValue = "Yes" Then
                        Dim comment_med As TextBox = NewUserContent.FindControl("comment_med")
                        If comment_med IsNot Nothing Then
                            SetValue(objCandidate, "CandidateMedicalConditions", comment_med.Text)
                        End If
                    End If
                End If

                Dim criminal_cond_list As RadioButtonList = NewUserContent.FindControl("criminal_cond_list")
                If criminal_cond_list IsNot Nothing Then
                    If criminal_cond_list.SelectedValue = "Yes" Then
                        Dim comment_med As TextBox = NewUserContent.FindControl("comment_med")
                        If comment_med IsNot Nothing Then
                            SetValue(objCandidate, "CandidateMedicalConditions", comment_med.Text)
                        End If
                    End If
                End If
            End If
            objCandidate.Save(objTransaction)
            objValidate = objTransaction.Validate
            'validate before commit
            If objValidate.Status <> 3 Then
                objTransaction.Commit()
                saved = True
                'TestL.Text = anchor.HRef.ToString()
                Response.Redirect("~/NewUser/" & anchor.HRef.ToString())
            Else
                'lblMessage.Text = objValidate.Result.Message
                objTransaction = Nothing
                saved = False
            End If
            objTransaction = Nothing
            objValidate = Nothing
        End If
    End Sub
End Class