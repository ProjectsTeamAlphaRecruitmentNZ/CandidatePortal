Imports StayinFront.Engine
Partial Class Skills
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Display Values
        Dim objUserName As String = Session("Username")
        Dim objCandidate As IAeClassInst = GetInstance(SIFConn.TheSystem.This, "Candidate", False, "Username='" + Session("Username") & "'")

        Dim objFolders As IAeFolders = SIFConn.TheSystem.This.Folders
        Dim objFolder As IAeFolder = objFolders("SkillGroup")
        Dim skillgroups As IAeFolder = objFolder
        Dim strHTMLES As String = ""
        Dim j = 0
        For Each skillgroup As IAeClassInst In skillgroups
            strHTMLES &= "<div class='dropMenu' id=' " & j & "'>"
            strHTMLES &= "<div class='dropMenu--header'>"
            strHTMLES &= "<h2 class='h2-17 display-inline'>" & GetValue(skillgroup, "GroupName") & "</h2>"
            strHTMLES &= "<img src='../img/arrow-down-flat.png' class='img-dropMenu rotate' id='img" & j & "'>"
            strHTMLES &= "</div>"
            strHTMLES &= "<div class='cell-info details'>"
            strHTMLES &= "<div class='radio-input-grid'>"
            strHTMLES &= "<div class='radio-input-grid__row'>"
            Dim skillss As IAeFolder = skillgroup.Folders("skills")
            For Each skill As IAeClassInst In skillss.Scan("status='current'")
                'Add rows, columns and controls into table
                strHTMLES &= "<div class='radio-input-grid__column radio-input-grid__cw-3'> "
                strHTMLES &= "<input type='checkbox' value=" & skill.Key & " name=skill" & j & " id=" & skill.Key & " class='radio-check'"
                Dim candidateskills = objCandidate.Folders("candidateskills")
                For Each candidateskill As IAeClassInst In candidateskills
                    If candidateskill.Members("skill").Key = skill.Key Then
                        strHTMLES &= "checked='checked'"
                        Exit For
                    End If
                Next
                strHTMLES &= "/>"
                strHTMLES &= "<label for=" & skill.Key & "> " & skill.Prompt & " </label>"
                strHTMLES &= "</div>"
            Next
            strHTMLES &= "</div>"
            strHTMLES &= "</div>"
            strHTMLES &= "</div>"
            strHTMLES &= "</div>"
            j = j + 1
        Next
        CandidateSkillsEdit.Text = strHTMLES
    End Sub


End Class
