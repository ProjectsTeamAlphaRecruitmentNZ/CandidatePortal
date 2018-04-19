Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.Web.Script.Services
Imports StayinFront.Engine
Imports System.Net
Imports System.Globalization
Imports System.Object
Imports System.Web.UI
Partial Public Class ProfileInfo4
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim objFolders As IAeFolders = CType(Master.Master, Portal).SIFSystem.Folders
        Dim objFolder As IAeFolder = objFolders("SkillGroup")
        Dim skillgroups As IAeFolder = objFolder
        If Not Page.IsPostBack Then
            'Set the logged in User
            Dim objUserName As String = Session("Username")
            Dim objCandidate As IAeClassInst = GetInstance(CType(Master.Master, Portal).SIFSystem, "Candidate", False, "Username='" + Session("Username") & "'")
            'Scan and fetch Skill Groups
            If Not objCandidate Is Nothing Then

                Dim existVal As Boolean = False

                'Display Values
                Dim strHTML1 As String = ""
                Dim j = 0
                For Each skillgroup As IAeClassInst In skillgroups
                    strHTML1 &= "<div class='dropMenu' id=' " & j & "'>"
                    strHTML1 &= "<div class='dropMenu--header'>"
                    strHTML1 &= "<h2 class='h2-17 display-inline'>" & GetValue(skillgroup, "GroupName") & "</h2>"
                    strHTML1 &= "<div class='plusMinusContainer'><img src='../img/angle-arrow-down.svg' class='img-dropMenu rotate' id='img" & j & "'></div>"
                    strHTML1 &= "</div>"
                    strHTML1 &= "<div class='cell-info details'>"
                    strHTML1 &= "<div class='radio-input-grid'>"
                    strHTML1 &= "<div class='radio-input-grid__row'>"
                    Dim skills As IAeFolder = skillgroup.Folders("skills")
                    For Each skill As IAeClassInst In skills.Scan("status='current'")
                        'Add rows, columns and controls into table
                        strHTML1 &= "<div class='radio-input-grid__column'> "
                        strHTML1 &= "<input type='checkbox' value=" & skill.Key & " name=skill" & j & " id=" & skill.Key & " class='radio-check'"
                        Dim candidateskills = objCandidate.Folders("candidateskills")
                        For Each candidateskill As IAeClassInst In candidateskills
                            If candidateskill.Members("skill").Key = skill.Key Then
                                strHTML1 &= "checked='checked'"
                                existVal = True
                                Exit For
                            End If
                        Next
                        strHTML1 &= "/>"
                        strHTML1 &= "<label class='centerLabel' for=" & skill.Key & " class = 'hiddenOverflow'> " & skill.Prompt & " </label>"
                        strHTML1 &= "</div>"
                    Next
                    strHTML1 &= "</div>"
                    strHTML1 &= "</div>"
                    strHTML1 &= "</div>"
                    strHTML1 &= "</div>"
                    j = j + 1
                Next
                candSkillValues.Text = strHTML1
                exist.Value = GetValue(objCandidate, "IsDirectCandidate")
                isNewUser.Value = GetValue(objCandidate, "isNewUser")
                IsDirect.Value = GetValue(objCandidate, "IsDirectCandidate")
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
        Dim objFolder As IAeFolder = objFolders("SkillGroup")
        Dim skillgroups As IAeFolder = objFolder

        Dim candidateskills = objCandidate.Folders("candidateskills")
        Dim intSkillCount = objFolders("SkillGroup").Count

        If Not objCandidate Is Nothing Then
            Dim counter = GetValue(objCandidate, "OnlineRegCounter")
            If counter Is Nothing Then
                counter = 5
            Else

                counter = 5

            End If
            SetValue(objCandidate, "OnlineRegCounter", counter)
            For Each candidateskill In objCandidate.Folders("candidateskills")
                Dim valuetodelete = candidateskill.Key.ToString
                Dim deletecandidateprofilevalue = CType(Master.Master, Portal).SIFSystem.Classes("CandidateSkill").GetInstance(valuetodelete)
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
                                Dim newskill = CType(Master.Master, Portal).SIFSystem.Classes("Skill").GetInstance(currentvalue(j))
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
            objCandidate.Save(objTransaction)
            objValidate = objTransaction.Validate
            'validate before commit
            If objValidate.Status <> 3 Then
                objTransaction.Commit()
                saved = True
                Response.Redirect("~/NewUser/NewUser-ProfileInfo-5.aspx")
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