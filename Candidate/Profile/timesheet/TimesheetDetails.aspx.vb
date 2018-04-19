Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.Web.Script.Services
Imports StayinFront.Engine
Imports System.Net
Imports System.Globalization
Imports System.Object
Imports System.Web.UI
Imports System.Net.Mail

Partial Public Class Profile1
    Inherits System.Web.UI.Page

    Protected Sub ProfileInfo1_PreInit(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreInit

    End Sub

    Protected Sub ProfileInfo1_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        'If Session("Username") Is Nothing Then
        'Response.Redirect("http://www.alphaonline.co.nz/JobsOnline/candidatelogin/login.aspx?domain=JobOnline-Candidate&OriginalURL=%2Fjobsonline%2Fcandidate&Retry=0&Timeout=0&Lockout=0")
        'End If
    End Sub
    Function returnvalidtime(ByVal arrDayArray, ByVal intDay, ByVal intField)
        'check for presence of 12:00 a.m. value in Start Time comparing with Finish Time, if Finish Time is the same or blank clear it
        'check for presence of 12:00 a.m. value in Finish Time comparing with Start Time, if Start Time is the same or blank clear it
        Dim StartTime, FinishTime, return12hourformat, BreakStartTime, BreakFinishTime
        If intField = StartTime Or intField = FinishTime Then
            Dim tmeStartTime, tmeFinishTime
            tmeStartTime = return12hourformat(arrDayArray(intDay, StartTime))
            tmeFinishTime = return12hourformat(arrDayArray(intDay, FinishTime))
            If ((InStr(tmeStartTime, "a") And InStr(tmeStartTime, "12")) Or _
             tmeStartTime = "") And _
             ((InStr(tmeFinishTime, "a") And InStr(tmeFinishTime, "12")) Or _
             tmeFinishTime = "") Then
                returnvalidtime = ""
            Else
                If intField = StartTime And tmeStartTime > "" Then
                    returnvalidtime = tmeStartTime
                ElseIf intField = FinishTime And tmeFinishTime > "" Then
                    returnvalidtime = tmeFinishTime
                Else
                    returnvalidtime = ""
                End If
            End If
            'check for presence of 12:00 a.m. in Break Start or Break Finish and clear if present
        ElseIf intField = BreakStartTime Then
            Dim tmeBreakStart
            tmeBreakStart = return12hourformat(arrDayArray(intDay, intField))
            If (InStr(tmeBreakStart, "a") And InStr(tmeBreakStart, "12")) Or tmeBreakStart = "" Then
                returnvalidtime = ""
            Else
                returnvalidtime = tmeBreakStart
            End If
        ElseIf intField = BreakFinishTime Then
            Dim tmeBreakFinish
            tmeBreakFinish = return12hourformat(arrDayArray(intDay, intField))
            If (InStr(tmeBreakFinish, "a") And InStr(tmeBreakFinish, "12")) Or tmeBreakFinish = "" Then
                returnvalidtime = ""
            Else
                returnvalidtime = tmeBreakFinish
            End If
        Else
            returnvalidtime = ""
        End If

    End Function

    'returns the the hour in the 12 hour format (18=6)
    Function return12hourformat(ByVal tmeValue)
        Dim strNewValue

        If tmeValue > "" Then
            strNewValue = LCase(FormatDateTime(tmeValue, vbLongTime))
            strNewValue = Replace(strNewValue, ":00 ", " ")
            strNewValue = Replace(strNewValue, ":01 ", " ")
            strNewValue = Replace(strNewValue, "a.m.", "am")
            strNewValue = Replace(strNewValue, "p.m.", "pm")
            return12hourformat = strNewValue
        Else
            return12hourformat = ""
        End If


    End Function

    Function returnvalidtime2(ByVal arrDayArray, ByVal intDay, ByVal intField)

        If arrDayArray(intDay, intField) > "" Then
            returnvalidtime2 = arrDayArray(intDay, intField)
        Else
            returnvalidtime2 = ""
        End If

    End Function

    'Builds an array from all of the values for each day in the week, breaking down each time into hours and minutes
    Function BuildDayArray(ByVal oTSInst)
        Dim StartTime, FinishTime, BreakStartTime, BreakFinishTime, HoursSubTotal, LeaveReason, DayTotalHours, DayDate
        Dim DayArray(7, 8)

        DayArray(vbMonday, StartTime) = oTSInst.ToString("mondayStartTime")
        DayArray(vbMonday, FinishTime) = oTSInst.mondayFinishTime.value
        DayArray(vbMonday, BreakStartTime) = oTSInst.mondayBreakStart.value
        DayArray(vbMonday, BreakFinishTime) = oTSInst.mondayBreakFinish.value
        DayArray(vbMonday, HoursSubTotal) = oTSInst.mondaytotal
        DayArray(vbMonday, LeaveReason) = oTSInst.mondayleave.value
        DayArray(vbMonday, DayTotalHours) = oTSInst.MondayTotal
        DayArray(vbMonday, DayDate) = oTSInst.MondayDate

        DayArray(vbTuesday, StartTime) = oTSInst.TuesdayStartTime.value
        DayArray(vbTuesday, FinishTime) = oTSInst.TuesdayFinishTime.value
        DayArray(vbTuesday, BreakStartTime) = oTSInst.TuesdayBreakStart.value
        DayArray(vbTuesday, BreakFinishTime) = oTSInst.TuesdayBreakFinish.value
        DayArray(vbTuesday, HoursSubTotal) = oTSInst.Tuesdaytotal
        DayArray(vbTuesday, LeaveReason) = oTSInst.Tuesdayleave.value
        DayArray(vbTuesday, DayTotalHours) = oTSInst.TuesdayTotal
        DayArray(vbTuesday, DayDate) = oTSInst.TuesdayDate

        DayArray(vbWednesday, StartTime) = oTSInst.WednesdayStartTime.value
        DayArray(vbWednesday, FinishTime) = oTSInst.WednesdayFinishTime.value
        DayArray(vbWednesday, BreakStartTime) = oTSInst.WednesdayBreakStart.value
        DayArray(vbWednesday, BreakFinishTime) = oTSInst.WednesdayBreakFinish.value
        DayArray(vbWednesday, HoursSubTotal) = oTSInst.Wednesdaytotal
        DayArray(vbWednesday, LeaveReason) = oTSInst.Wednesdayleave.value
        DayArray(vbWednesday, DayTotalHours) = oTSInst.WednesdayTotal
        DayArray(vbWednesday, DayDate) = oTSInst.WednesdayDate

        DayArray(vbThursday, StartTime) = oTSInst.ThursdayStartTime.value
        DayArray(vbThursday, FinishTime) = oTSInst.ThursdayFinishTime.value
        DayArray(vbThursday, BreakStartTime) = oTSInst.ThursdayBreakStart.value
        DayArray(vbThursday, BreakFinishTime) = oTSInst.ThursdayBreakFinish.value
        DayArray(vbThursday, HoursSubTotal) = oTSInst.Thursdaytotal
        DayArray(vbThursday, LeaveReason) = oTSInst.Thursdayleave.value
        DayArray(vbThursday, DayTotalHours) = oTSInst.ThursdayTotal
        DayArray(vbThursday, DayDate) = oTSInst.ThursdayDate

        DayArray(vbFriday, StartTime) = oTSInst.FridayStartTime.value
        DayArray(vbFriday, FinishTime) = oTSInst.FridayFinishTime.value
        DayArray(vbFriday, BreakStartTime) = oTSInst.FridayBreakStart.value
        DayArray(vbFriday, BreakFinishTime) = oTSInst.FridayBreakFinish.value
        DayArray(vbFriday, HoursSubTotal) = oTSInst.Fridaytotal
        DayArray(vbFriday, LeaveReason) = oTSInst.Fridayleave.value
        DayArray(vbFriday, DayTotalHours) = oTSInst.FridayTotal
        DayArray(vbFriday, DayDate) = oTSInst.FridayDate

        DayArray(vbSaturday, StartTime) = oTSInst.SaturdayStartTime.value
        DayArray(vbSaturday, FinishTime) = oTSInst.SaturdayFinishTime.value
        DayArray(vbSaturday, BreakStartTime) = oTSInst.SaturdayBreakStart.value
        DayArray(vbSaturday, BreakFinishTime) = oTSInst.SaturdayBreakFinish.value
        DayArray(vbSaturday, HoursSubTotal) = oTSInst.Saturdaytotal
        DayArray(vbSaturday, LeaveReason) = oTSInst.Saturdayleave.value
        DayArray(vbSaturday, DayTotalHours) = oTSInst.SaturdayTotal
        DayArray(vbSaturday, DayDate) = oTSInst.SaturdayDate

        DayArray(vbSunday, StartTime) = oTSInst.SundayStartTime.value
        DayArray(vbSunday, FinishTime) = oTSInst.SundayFinishTime.value
        DayArray(vbSunday, BreakStartTime) = oTSInst.SundayBreakStart.value
        DayArray(vbSunday, BreakFinishTime) = oTSInst.SundayBreakFinish.value
        DayArray(vbSunday, HoursSubTotal) = oTSInst.Sundaytotal
        DayArray(vbSunday, LeaveReason) = oTSInst.Sundayleave.value
        DayArray(vbSunday, DayTotalHours) = oTSInst.SundayTotal
        DayArray(vbSunday, DayDate) = oTSInst.SundayDate

        BuildDayArray = DayArray

    End Function

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim strTSKey1 = Request.QueryString("strTSKey")
        TSKey.Value = strTSKey1
        Dim oTSInst = GetInstance(CType(Master.Master, Portal).SIFSystem, "Timesheets", False, "key='" + strTSKey1 & "'")

        Dim body As HtmlGenericControl = CType(Master.Master.FindControl("mainBody"), HtmlGenericControl)
        body.Attributes.Add("class", "profile")
        body.Attributes.Add("ng-app", "formController")
        Dim JobTest As String = GetJoinMemberKey(oTSInst, "Job")
        Dim oJobInst = GetInstance(CType(Master.Master, Portal).SIFSystem, "Jobs", False, "key='" + JobTest & "'")
        Dim Consult As String = GetJoinMemberKey(oJobInst, "Job")
        Dim oConsInst = GetInstance(CType(Master.Master, Portal).SIFSystem, "Consultants", False, "key='" + Consult & "'")
        ''Cant get a value, returns empty string
        test.Text = GetValue(oConsInst, "Name.FirstName")

        WeekEnding.Text = GetValue(oTSInst, "WeekEndingDate")
        Job.Text = GetValue(oTSInst, "Job.JobTitle")
        StartDate.Text = GetValue(oTSInst, "Job.JobStartDate")
        EndDate.Text = GetValue(oTSInst, "Job.JobEndDate")
        Organisation.Text = GetValue(oTSInst, "Job.Department.Organisation.Name")
        Department.Text = GetValue(oTSInst, "Job.Department.Name")
        ReportTo1.Text = GetValue(oTSInst, "Job.ReportsTo.Person.Name.FirstName")
        ReportTo2.Text = GetValue(oTSInst, "Job.ReportsTo.Person.Name.LastName")

        Dim arrDayArray, DayDate, textInputType, DayTotalHours, guidTimesheetKey, intWeekTotal, textComments
        Dim strHTML As String = ""

        intWeekTotal = GetValue(oTSInst, "WeekTotal")

        For i = 2 To 8
            Dim TimesheetDayRow As New TableRow()
            Dim cellDate As New TableCell()
            Dim cellDay As New TableCell()
            Dim cellStart As New TableCell()
            Dim cellBreakStart As New TableCell()
            Dim cellBreakFinish As New TableCell()
            Dim cellFinish As New TableCell()
            Dim cellHours As New TableCell()
            Dim cellStatus As New TableCell()
            Dim cellLeave As New TableCell()
            Dim dayName As String
            Dim null = "0.0000"

            TimesheetDayRow.Attributes.Add("class", "click-to-show")
            dayName = "Monday"
            Select Case i
                Case 2
                    dayName = "Monday"
                    cellDay.Text = "Mon"
                Case 3
                    dayName = "Tuesday"
                    cellDay.Text = "Tue"
                Case 4
                    dayName = "Wednesday"
                    cellDay.Text = "Wed"
                Case 5
                    dayName = "Thursday"
                    cellDay.Text = "Thu"
                Case 6
                    dayName = "Friday"
                    cellDay.Text = "Fri"
                Case 7
                    dayName = "Saturday"
                    cellDay.Text = "Sat"
                Case 8
                    dayName = "Sunday"
                    cellDay.Text = "Sun"
                    i = 1
            End Select

            Dim totalH As String = GetValue(oTSInst, dayName & "Total")

            If totalH = null Then
                totalH = "0"
            End If
            cellDate.Text = GetValue(oTSInst, dayName & "Date")
            'cellStart.Text = GetValue(oTSInst, dayName & "StartTime")
            cellBreakStart.Text = GetValue(oTSInst, dayName & "BreakStart")
            cellBreakFinish.Text = GetValue(oTSInst, dayName & "BreakFinish")
            cellFinish.Text = GetValue(oTSInst, dayName & "FinishTime")

            cellLeave.Text = GetValue(oTSInst, dayName & "Leave")

            Dim copyHours As TextBox = New TextBox()
            copyHours.Attributes.Add("readonly", "readonly")
            copyHours.Attributes.Add("onfocus", "this.blur()")
            copyHours.Attributes.Add("class", i & "dayHoursSubTotal")
            copyHours.Attributes.Add("idNotServer", i & "dayHoursSubTotal")
            copyHours.ID = i & "dayHoursSubTotal"
            copyHours.Text = totalH
            Dim copyLink As HyperLink = New HyperLink()
            copyLink.Attributes.Add("id", i & "dayCopyHours")
            copyLink.Attributes.Add("class", "ui-state-default ui-corner-all uicopyhours CopyHours")
            copyLink.Text = "Copy Hours"
            cellHours.Controls.Add(copyHours)
            cellHours.Controls.Add(copyLink)

            For j = 1 To 5
                Dim cellDiv As HtmlGenericControl = New HtmlGenericControl("DIV")
                cellDiv.Attributes.Add("class", "uiinputtimecontainer")
                Dim timeField As TextBox = New TextBox
                timeField.Attributes.Add("class", "uiinputtime")
                cellDiv.Attributes.Add("id", "sample1")
                cellDay.Attributes.Add("class", "daybox w5")

                cellDiv.Controls.Add(timeField)

                Dim removeDiv As HtmlGenericControl = New HtmlGenericControl("DIV")
                removeDiv.Attributes.Add("class", "ui-state-default ui-corner-all removetimeiconcontainer uibutton")
                Dim removeLabel As Label = New Label
                removeLabel.Attributes.Add("class", "ui-icon ui-icon-circle-close uibuttonicon")
                removeDiv.Controls.Add(removeLabel)
                Select Case j
                    Case 1
                        textInputType = "StartTime"
                        cellStart.Controls.Add(cellDiv)
                        cellStart.Controls.Add(removeDiv)
                    Case 2
                        textInputType = "BreakStart"
                        cellBreakStart.Controls.Add(cellDiv)
                        cellBreakStart.Controls.Add(removeDiv)
                    Case 3
                        textInputType = "BreakFinish"
                        cellBreakFinish.Controls.Add(cellDiv)
                        cellBreakFinish.Controls.Add(removeDiv)
                    Case 4
                        textInputType = "FinishTime"
                        cellFinish.Controls.Add(cellDiv)
                        cellFinish.Controls.Add(removeDiv)

                End Select
                timeField.ID = i & "day" & textInputType & "icon"
                timeField.Attributes.Add("idNotServer", i & "day" & textInputType)
                timeField.Text = GetValue(oTSInst, dayName & textInputType)
                If GetValue(oTSInst, dayName & "Leave") = "" Then
                Else
                    timeField.Enabled = False
                End If
                removeDiv.Attributes.Add("id", i & "day" & textInputType & "icon")
                removeDiv.Attributes.Add("onclick", "javascript:clearvalue('" & i & "day" & textInputType & "')")
                cellStatus.Attributes.Add("id", i & "daycheckiconcontainer")
                cellStatus.Attributes.Add("class", "noprint")
            Next
            If i = 1 Then
                i = 8
            End If
            cellDate.Attributes.Add("class", "dayDate")

            cellHours.Attributes.Add("class", "w85")

            cellLeave.Attributes.Add("class", "w20")
            Dim enterLeave As HtmlGenericControl = New HtmlGenericControl("DIV")
            enterLeave.Attributes.Add("class", "ui-state-default ui-corner-all uibutton uidayofleavebutton")
            enterLeave.Attributes.Add("id", i & "dayDayofLeavevalue")
            If GetValue(oTSInst, dayName & "Leave") = "" Then

                enterLeave.InnerText = "Enter Leave"

            Else
                enterLeave.InnerText = GetValue(oTSInst, dayName & "Leave")
            End If
            Dim leaveHidden As HiddenField = New HiddenField
            leaveHidden.ID = i & "dayDayofLeavevalue"
            leaveHidden.Value = GetValue(oTSInst, dayName & "Leave")


            Dim copyLabel As Label = New Label
            copyLabel.Attributes.Add("id", i & "daycheckicon")

            cellLeave.Controls.Add(leaveHidden)
            cellLeave.Controls.Add(enterLeave)


            cellStart.Attributes.Add("class", "timeCol2")
            cellBreakStart.Attributes.Add("class", "timeCol2")
            cellBreakFinish.Attributes.Add("class", "timeCol2")
            cellFinish.Attributes.Add("class", "timeCol2")
            cellHours.Attributes.Add("class", "timeCol3 brdr-right-none")
            cellStatus.Attributes.Add("class", "timeCol4 brdr-left-none")
            cellLeave.Attributes.Add("class", "timeCol5")
            TimesheetDayRow.Cells.Add(cellDate)
            TimesheetDayRow.Cells.Add(cellDay)
            TimesheetDayRow.Cells.Add(cellStart)
            TimesheetDayRow.Cells.Add(cellBreakStart)
            TimesheetDayRow.Cells.Add(cellBreakFinish)
            TimesheetDayRow.Cells.Add(cellFinish)
            TimesheetDayRow.Cells.Add(cellHours)
            TimesheetDayRow.Cells.Add(cellStatus)
            TimesheetDayRow.Cells.Add(cellLeave)

            TableTimesheet.Rows.Add(TimesheetDayRow)
        Next

        Dim TimesheetFooter As New TableFooterRow()
        Dim cellFootState As New TableCell()
        Dim cellFootLabel As New TableCell()
        Dim cellFootHours As New TableCell()
        Dim cellFootButton As New TableCell()

        Dim iconDiv As HtmlGenericControl = New HtmlGenericControl("DIV")
        iconDiv.Attributes.Add("id", "currentstateiconcontainer")
        iconDiv.Attributes.Add("class", "noprint")
        Dim messageDiv As HtmlGenericControl = New HtmlGenericControl("DIV")
        messageDiv.Attributes.Add("id", "currentstatemessage")
        messageDiv.Attributes.Add("class", "statemessage noprint")
        Dim stateLabel As Label = New Label
        stateLabel.Attributes.Add("id", "currentstateicon")
        iconDiv.Controls.Add(stateLabel)
        cellFootState.Controls.Add(iconDiv)
        cellFootState.Controls.Add(messageDiv)
        cellFootState.Attributes.Add("style", "vertical-align:middle; padding:10px; border:none;")
        cellFootState.Attributes.Add("colspan", "5")

        Dim labelDiv As HtmlGenericControl = New HtmlGenericControl("DIV")
        labelDiv.Attributes.Add("align", "right")
        Dim labelB As HtmlGenericControl = New HtmlGenericControl("B")
        labelB.InnerText = "Total Hours:"
        labelDiv.Controls.Add(labelB)
        cellFootLabel.Controls.Add(labelDiv)
        cellFootLabel.Attributes.Add("style", "vertical-align:middle; padding:10px; border:none;")

        TimesheetFooter.Cells.Add(cellFootState)
        TimesheetFooter.Cells.Add(cellFootLabel)
        TableTimesheet.Rows.Add(TimesheetFooter)
        'Dim tableFoot As TableFooterRow
        strHTML &= "<tfoot>"
        strHTML &= "<tr>"
        strHTML &= "<td colspan=""4"" style=""vertical-align:middle; padding:10px"">"
        strHTML &= "<div class="""" id=""currentstateiconcontainer"">"
        strHTML &= "<span id=""currentstateicon"" class="""">" & "</span>"
        strHTML &= "</div>"
        strHTML &= "<div id=""currentstatemessage"" class=""statemessage"">"
        strHTML &= "</div>"
        strHTML &= "</td>"
        strHTML &= "<td colspan=""2"" style=""vertical-align:middle; padding:10px"">"
        strHTML &= "<div class='text-align-right text-align-mobile-left'>" & "Total Hours:" & "</td>"
        strHTML &= "<td colspan=""1"">"
        strHTML &= "<div align=""left"" class='text-align-mobile-left mobile-totalhours-input' style=""font-weight : bold; text-align: end;"">"
        strHTML &= "<input id=""WeekTotalHours"" style='width:40px;height:25px'  name=""WeekTotalHours"" type=""text"" readonly=""readonly"" size=""4"" value=""" & intWeekTotal & """>"
        strHTML &= "</div>"
        strHTML &= "</td>"
        strHTML &= "<td colspan=""2"">"
        strHTML &= "<div id=""hours_link"" class=""ui-state-default ui-corner-all uibutton mobile-calcbtn"">"
        strHTML &= "<div class=""calculatebuttontext btn--primary width150-mobile"">Calculate Hours</div>"
        strHTML &= "</div>"
        strHTML &= "</td>"
        strHTML &= "</tr>"

        strHTML &= "<tr class='mobile--mt7'><td colspan=""9""><div class='comment-header'>If you have any comments or notes about the details contained in this timesheet, please enter them below.</div></td></tr>"
        strHTML &= "<tr class='height120-mobile'>" & "<td colspan=""9""><textarea name=""Comments"" cols=""85"" rows=""3"" >" & textComments & "</textarea></td>" & "</tr>"
        strHTML &= "<tr class='no-table-background'><td colspan=""9"" style=""vertical-align:middle; padding:10px"">" & "<div align=""center"" class=""noprint width-button"" >" & "<a href=""#"" id=""print_link"" class=""btnTimesheet width-button ui-state-default ui-corner-all ui-button-text uibutton uipagebutton"">Print Timesheet</a>" & "<a href=""#""  id=""save_link"" class=""btnTimesheet ui-state-default ui-corner-all ui-button-text uibutton uipagebutton"" title=""Use this if your Timesheet is not complete"">Save and Exit</a>" & "<a href=""#"" id=""submit_link"" class=""btnTimesheet border-button ui-state-default ui-corner-all ui-button-text uibutton uipagebutton"" title=""Send Timesheet to Client for approval"">Submit for Approval</a>" & "</div></td>"
        strHTML &= "</tr>"
        strHTML &= "</tfoot>"
        strHTML &= "</table>"
        strHTML &= "<input type=""hidden"" id=""Timesheetkey"" name=""Timesheetkey"" value=" & guidTimesheetKey & ">"
        strHTML &= "<input type=""hidden"" id=""formaction"" name=""formaction"" value=""saveandexit"">"
        strHTML &= "</form>"
        writeDayTable.Text = strHTML
    End Sub

    Protected Sub Save_Time(ByVal sender As Object, ByVal e As System.EventArgs) Handles SaveTime.Click

        Dim strTSKey1 = TSKey.Value
        Dim oTSInst = GetInstance(CType(Master.Master, Portal).SIFSystem, "Timesheets", False, "key='" + strTSKey1 & "'")

        saved = False
        Dim objValidate As IAeValidate = Nothing
        Dim objTransaction As IAeTransaction = CType(Master.Master, Portal).SIFSystem.BeginTransaction
        If Not oTSInst Is Nothing Then
            Dim strValue = ""
            For Each key In Request.Form.AllKeys
                If Request.Form(key).ToString = "" Or Request.Form(key).ToString Is Nothing Then
                    If key.Contains("2dayStartTimeicon") Then
                        SetValue(oTSInst, "MondayStartTime", Nothing)
                    End If
                    If key.Contains("2dayBreakStarticon") Then
                        SetValue(oTSInst, "MondayBreakStart", Nothing)
                    End If
                    If key.Contains("2dayBreakFinishicon") Then
                        SetValue(oTSInst, "MondayBreakFinish", Nothing)
                    End If
                    If key.Contains("2dayFinishTimeicon") Then
                        SetValue(oTSInst, "MondayFinishTime", Nothing)
                    End If
                    If key.Contains("2dayHoursSubTotal") Then
                        SetValue(oTSInst, "MondayTotal", Nothing)
                    End If
                    If key.Contains("2dayDayofLeavevalue") Then
                        SetValue(oTSInst, "MondayLeave", Nothing)
                    End If

                    If key.Contains("3dayStartTimeicon") Then
                        SetValue(oTSInst, "TuesdayStartTime", Nothing)
                    End If
                    If key.Contains("3dayBreakStarticon") Then
                        SetValue(oTSInst, "TuesdayBreakStart", Nothing)
                    End If
                    If key.Contains("3dayBreakFinishicon") Then
                        SetValue(oTSInst, "TuesdayBreakFinish", Nothing)
                    End If
                    If key.Contains("3dayFinishTimeicon") Then
                        SetValue(oTSInst, "TuesdayFinishTime", Nothing)
                    End If
                    If key.Contains("3dayHoursSubTotal") Then
                        SetValue(oTSInst, "TuesdayTotal", Nothing)
                    End If
                    If key.Contains("3dayDayofLeavevalue") Then
                        SetValue(oTSInst, "TuesdayLeave", Nothing)
                    End If

                    If key.Contains("4dayStartTimeicon") Then
                        SetValue(oTSInst, "WednesdayStartTime", Nothing)
                    End If
                    If key.Contains("4dayBreakStarticon") Then
                        SetValue(oTSInst, "WednesdayBreakStart", Nothing)
                    End If
                    If key.Contains("4dayBreakFinishicon") Then
                        SetValue(oTSInst, "WednesdayBreakFinish", Nothing)
                    End If
                    If key.Contains("4dayFinishTimeicon") Then
                        SetValue(oTSInst, "WednesdayFinishTime", Nothing)
                    End If
                    If key.Contains("4dayHoursSubTotal") Then
                        SetValue(oTSInst, "WednesdayTotal", Nothing)
                    End If
                    If key.Contains("4dayDayofLeavevalue") Then
                        SetValue(oTSInst, "WednesdayLeave", Nothing)
                    End If

                    If key.Contains("5dayStartTimeicon") Then
                        SetValue(oTSInst, "ThursdayStartTime", Nothing)
                    End If
                    If key.Contains("5dayBreakStarticon") Then
                        SetValue(oTSInst, "ThursdayBreakStart", Nothing)
                    End If
                    If key.Contains("5dayBreakFinishicon") Then
                        SetValue(oTSInst, "ThursdayBreakFinish", Nothing)
                    End If
                    If key.Contains("5dayFinishTimeicon") Then
                        SetValue(oTSInst, "ThursdayFinishTime", Nothing)
                    End If
                    If key.Contains("5dayHoursSubTotal") Then
                        SetValue(oTSInst, "ThursdayTotal", Nothing)
                    End If
                    If key.Contains("5dayDayofLeavevalue") Then
                        SetValue(oTSInst, "ThursdayLeave", Nothing)
                    End If

                    If key.Contains("6dayStartTimeicon") Then
                        SetValue(oTSInst, "FridayStartTime", Nothing)
                    End If
                    If key.Contains("6dayBreakStarticon") Then
                        SetValue(oTSInst, "FridayBreakStart", Nothing)
                    End If
                    If key.Contains("6dayBreakFinishicon") Then
                        SetValue(oTSInst, "FridayBreakFinish", Nothing)
                    End If
                    If key.Contains("6dayFinishTimeicon") Then
                        SetValue(oTSInst, "FridayFinishTime", Nothing)
                    End If
                    If key.Contains("6dayHoursSubTotal") Then
                        SetValue(oTSInst, "FridayTotal", Nothing)
                    End If
                    If key.Contains("6dayDayofLeavevalue") Then
                        SetValue(oTSInst, "FridayLeave", Nothing)
                    End If

                    If key.Contains("7dayStartTimeicon") Then
                        SetValue(oTSInst, "SaturdayStartTime", Nothing)
                    End If
                    If key.Contains("7dayBreakStarticon") Then
                        SetValue(oTSInst, "SaturdayBreakStart", Nothing)
                    End If
                    If key.Contains("7dayBreakFinishicon") Then
                        SetValue(oTSInst, "SaturdayBreakFinish", Nothing)
                    End If
                    If key.Contains("7dayFinishTimeicon") Then
                        SetValue(oTSInst, "SaturdayFinishTime", Nothing)
                    End If
                    If key.Contains("7dayHoursSubTotal") Then
                        SetValue(oTSInst, "SaturdayTotal", Nothing)
                    End If
                    If key.Contains("7dayDayofLeavevalue") Then
                        SetValue(oTSInst, "SaturdayLeave", Nothing)
                    End If

                    If key.Contains("1dayStartTimeicon") Then
                        SetValue(oTSInst, "SundayStartTime", Nothing)
                    End If
                    If key.Contains("1dayBreakStarticon") Then
                        SetValue(oTSInst, "SundayBreakStart", Nothing)
                    End If
                    If key.Contains("1dayBreakFinishicon") Then
                        SetValue(oTSInst, "SundayBreakFinish", Nothing)
                    End If
                    If key.Contains("1dayFinishTimeicon") Then
                        SetValue(oTSInst, "SundayFinishTime", Nothing)
                    End If
                    If key.Contains("1dayHoursSubTotal") Then
                        SetValue(oTSInst, "SundayTotal", Nothing)
                    End If
                    If key.Contains("1dayDayofLeavevalue") Then
                        SetValue(oTSInst, "SundayLeave", Nothing)
                    End If
                Else
                    If key.Contains("2dayStartTimeicon") Then
                        SetValue(oTSInst, "MondayStartTime", Request.Form(key).ToString)
                    End If
                    If key.Contains("2dayBreakStarticon") Then
                        SetValue(oTSInst, "MondayBreakStart", Request.Form(key).ToString)
                    End If
                    If key.Contains("2dayBreakFinishicon") Then
                        SetValue(oTSInst, "MondayBreakFinish", Request.Form(key).ToString)
                    End If
                    If key.Contains("2dayFinishTimeicon") Then
                        SetValue(oTSInst, "MondayFinishTime", Request.Form(key).ToString)
                    End If
                    If key.Contains("2dayHoursSubTotal") Then
                        SetValue(oTSInst, "MondayTotal", Request.Form(key).ToString)
                    End If
                    If key.Contains("2dayDayofLeavevalue") Then
                        SetValue(oTSInst, "MondayLeave", Request.Form(key).ToString)
                    End If

                    If key.Contains("3dayStartTimeicon") Then
                        SetValue(oTSInst, "TuesdayStartTime", Request.Form(key).ToString)
                    End If
                    If key.Contains("3dayBreakStarticon") Then
                        SetValue(oTSInst, "TuesdayBreakStart", Request.Form(key).ToString)
                    End If
                    If key.Contains("3dayBreakFinishicon") Then
                        SetValue(oTSInst, "TuesdayBreakFinish", Request.Form(key).ToString)
                    End If
                    If key.Contains("3dayFinishTimeicon") Then
                        SetValue(oTSInst, "TuesdayFinishTime", Request.Form(key).ToString)
                    End If
                    If key.Contains("3dayHoursSubTotal") Then
                        SetValue(oTSInst, "TuesdayTotal", Request.Form(key).ToString)
                    End If

                    If key.Contains("4dayStartTimeicon") Then
                        SetValue(oTSInst, "WednesdayStartTime", Request.Form(key).ToString)
                    End If
                    If key.Contains("4dayBreakStarticon") Then
                        SetValue(oTSInst, "WednesdayBreakStart", Request.Form(key).ToString)
                    End If
                    If key.Contains("4dayBreakFinishicon") Then
                        SetValue(oTSInst, "WednesdayBreakFinish", Request.Form(key).ToString)
                    End If
                    If key.Contains("4dayFinishTimeicon") Then
                        SetValue(oTSInst, "WednesdayFinishTime", Request.Form(key).ToString)
                    End If
                    If key.Contains("4dayHoursSubTotal") Then
                        SetValue(oTSInst, "WednesdayTotal", Request.Form(key).ToString)
                    End If

                    If key.Contains("5dayStartTimeicon") Then
                        SetValue(oTSInst, "ThursdayStartTime", Request.Form(key).ToString)
                    End If
                    If key.Contains("5dayBreakStarticon") Then
                        SetValue(oTSInst, "ThursdayBreakStart", Request.Form(key).ToString)
                    End If
                    If key.Contains("5dayBreakFinishicon") Then
                        SetValue(oTSInst, "ThursdayBreakFinish", Request.Form(key).ToString)
                    End If
                    If key.Contains("5dayFinishTimeicon") Then
                        SetValue(oTSInst, "ThursdayFinishTime", Request.Form(key).ToString)
                    End If
                    If key.Contains("5dayHoursSubTotal") Then
                        SetValue(oTSInst, "ThursdayTotal", Request.Form(key).ToString)
                    End If

                    If key.Contains("6dayStartTimeicon") Then
                        SetValue(oTSInst, "FridayStartTime", Request.Form(key).ToString)
                    End If
                    If key.Contains("6dayBreakStarticon") Then
                        SetValue(oTSInst, "FridayBreakStart", Request.Form(key).ToString)
                    End If
                    If key.Contains("6dayBreakFinishicon") Then
                        SetValue(oTSInst, "FridayBreakFinish", Request.Form(key).ToString)
                    End If
                    If key.Contains("6dayFinishTimeicon") Then
                        SetValue(oTSInst, "FridayFinishTime", Request.Form(key).ToString)
                    End If
                    If key.Contains("6dayHoursSubTotal") Then
                        SetValue(oTSInst, "FridayTotal", Request.Form(key).ToString)
                    End If

                    If key.Contains("7dayStartTimeicon") Then
                        SetValue(oTSInst, "SaturdayStartTime", Request.Form(key).ToString)
                    End If
                    If key.Contains("7dayBreakStarticon") Then
                        SetValue(oTSInst, "SaturdayBreakStart", Request.Form(key).ToString)
                    End If
                    If key.Contains("7dayBreakFinishicon") Then
                        SetValue(oTSInst, "SaturdayBreakFinish", Request.Form(key).ToString)
                    End If
                    If key.Contains("7dayFinishTimeicon") Then
                        SetValue(oTSInst, "SaturdayFinishTime", Request.Form(key).ToString)
                    End If
                    If key.Contains("7dayHoursSubTotal") Then
                        SetValue(oTSInst, "SaturdayTotal", Request.Form(key).ToString)
                    End If

                    If key.Contains("1dayStartTimeicon") Then
                        SetValue(oTSInst, "SundayStartTime", Request.Form(key).ToString)
                    End If
                    If key.Contains("1dayBreakStarticon") Then
                        SetValue(oTSInst, "SundayBreakStart", Request.Form(key).ToString)
                    End If
                    If key.Contains("1dayBreakFinishicon") Then
                        SetValue(oTSInst, "SundayBreakFinish", Request.Form(key).ToString)
                    End If
                    If key.Contains("1dayFinishTimeicon") Then
                        SetValue(oTSInst, "SundayFinishTime", Request.Form(key).ToString)
                    End If
                    If key.Contains("1dayHoursSubTotal") Then
                        SetValue(oTSInst, "SundayTotal", Request.Form(key).ToString)
                    End If

                End If

            Next

            oTSInst.Save(objTransaction)
            objValidate = objTransaction.Validate
            If objValidate.Status <> 3 Then
                objTransaction.Commit()
                saved = True
                Response.Redirect("~/Profile/timesheet/TimesheetDetails.aspx?strTSKey=" + strTSKey1)
            End If
        End If

    End Sub

    Protected Sub Submit_Time(ByVal sender As Object, ByVal e As System.EventArgs) Handles SubmitTime.Click

        Dim strTSKey1 = TSKey.Value
        Dim oTSInst = GetInstance(CType(Master.Master, Portal).SIFSystem, "Timesheets", False, "key='" + strTSKey1 & "'")

        saved = False
        Dim objValidate As IAeValidate = Nothing
        Dim objTransaction As IAeTransaction = CType(Master.Master, Portal).SIFSystem.BeginTransaction
        If Not oTSInst Is Nothing Then
            Dim strValue = ""
            For Each key In Request.Form.AllKeys
                If Request.Form(key).ToString = "" Then
                    If key.Contains("2dayStartTimeicon") Then
                        SetValue(oTSInst, "MondayStartTime", Nothing)
                    End If
                    If key.Contains("2dayBreakStarticon") Then
                        SetValue(oTSInst, "MondayBreakStart", Nothing)
                    End If
                    If key.Contains("2dayBreakFinishicon") Then
                        SetValue(oTSInst, "MondayBreakFinish", Nothing)
                    End If
                    If key.Contains("2dayFinishTimeicon") Then
                        SetValue(oTSInst, "MondayFinishTime", Nothing)
                    End If
                    If key.Contains("2dayHoursSubTotal") Then
                        SetValue(oTSInst, "MondayTotal", Nothing)
                    End If
                    If key.Contains("2dayDayofLeavevalue") Then
                        SetValue(oTSInst, "MondayLeave", Nothing)
                    End If

                    If key.Contains("3dayStartTimeicon") Then
                        SetValue(oTSInst, "TuesdayStartTime", Nothing)
                    End If
                    If key.Contains("3dayBreakStarticon") Then
                        SetValue(oTSInst, "TuesdayBreakStart", Nothing)
                    End If
                    If key.Contains("3dayBreakFinishicon") Then
                        SetValue(oTSInst, "TuesdayBreakFinish", Nothing)
                    End If
                    If key.Contains("3dayFinishTimeicon") Then
                        SetValue(oTSInst, "TuesdayFinishTime", Nothing)
                    End If
                    If key.Contains("3dayHoursSubTotal") Then
                        SetValue(oTSInst, "TuesdayTotal", Nothing)
                    End If
                    If key.Contains("3dayDayofLeavevalue") Then
                        SetValue(oTSInst, "TuesdayLeave", Nothing)
                    End If

                    If key.Contains("4dayStartTimeicon") Then
                        SetValue(oTSInst, "WednesdayStartTime", Nothing)
                    End If
                    If key.Contains("4dayBreakStarticon") Then
                        SetValue(oTSInst, "WednesdayBreakStart", Nothing)
                    End If
                    If key.Contains("4dayBreakFinishicon") Then
                        SetValue(oTSInst, "WednesdayBreakFinish", Nothing)
                    End If
                    If key.Contains("4dayFinishTimeicon") Then
                        SetValue(oTSInst, "WednesdayFinishTime", Nothing)
                    End If
                    If key.Contains("4dayHoursSubTotal") Then
                        SetValue(oTSInst, "WednesdayTotal", Nothing)
                    End If
                    If key.Contains("4dayDayofLeavevalue") Then
                        SetValue(oTSInst, "WednesdayLeave", Nothing)
                    End If

                    If key.Contains("5dayStartTimeicon") Then
                        SetValue(oTSInst, "ThursdayStartTime", Nothing)
                    End If
                    If key.Contains("5dayBreakStarticon") Then
                        SetValue(oTSInst, "ThursdayBreakStart", Nothing)
                    End If
                    If key.Contains("5dayBreakFinishicon") Then
                        SetValue(oTSInst, "ThursdayBreakFinish", Nothing)
                    End If
                    If key.Contains("5dayFinishTimeicon") Then
                        SetValue(oTSInst, "ThursdayFinishTime", Nothing)
                    End If
                    If key.Contains("5dayHoursSubTotal") Then
                        SetValue(oTSInst, "ThursdayTotal", Nothing)
                    End If
                    If key.Contains("5dayDayofLeavevalue") Then
                        SetValue(oTSInst, "ThursdayLeave", Nothing)
                    End If

                    If key.Contains("6dayStartTimeicon") Then
                        SetValue(oTSInst, "FridayStartTime", Nothing)
                    End If
                    If key.Contains("6dayBreakStarticon") Then
                        SetValue(oTSInst, "FridayBreakStart", Nothing)
                    End If
                    If key.Contains("6dayBreakFinishicon") Then
                        SetValue(oTSInst, "FridayBreakFinish", Nothing)
                    End If
                    If key.Contains("6dayFinishTimeicon") Then
                        SetValue(oTSInst, "FridayFinishTime", Nothing)
                    End If
                    If key.Contains("6dayHoursSubTotal") Then
                        SetValue(oTSInst, "FridayTotal", Nothing)
                    End If
                    If key.Contains("6dayDayofLeavevalue") Then
                        SetValue(oTSInst, "FridayLeave", Nothing)
                    End If

                    If key.Contains("7dayStartTimeicon") Then
                        SetValue(oTSInst, "SaturdayStartTime", Nothing)
                    End If
                    If key.Contains("7dayBreakStarticon") Then
                        SetValue(oTSInst, "SaturdayBreakStart", Nothing)
                    End If
                    If key.Contains("7dayBreakFinishicon") Then
                        SetValue(oTSInst, "SaturdayBreakFinish", Nothing)
                    End If
                    If key.Contains("7dayFinishTimeicon") Then
                        SetValue(oTSInst, "SaturdayFinishTime", Nothing)
                    End If
                    If key.Contains("7dayHoursSubTotal") Then
                        SetValue(oTSInst, "SaturdayTotal", Nothing)
                    End If
                    If key.Contains("7dayDayofLeavevalue") Then
                        SetValue(oTSInst, "SaturdayLeave", Nothing)
                    End If

                    If key.Contains("1dayStartTimeicon") Then
                        SetValue(oTSInst, "SundayStartTime", Nothing)
                    End If
                    If key.Contains("1dayBreakStarticon") Then
                        SetValue(oTSInst, "SundayBreakStart", Nothing)
                    End If
                    If key.Contains("1dayBreakFinishicon") Then
                        SetValue(oTSInst, "SundayBreakFinish", Nothing)
                    End If
                    If key.Contains("1dayFinishTimeicon") Then
                        SetValue(oTSInst, "SundayFinishTime", Nothing)
                    End If
                    If key.Contains("1dayHoursSubTotal") Then
                        SetValue(oTSInst, "SundayTotal", Nothing)
                    End If
                    If key.Contains("1dayDayofLeavevalue") Then
                        SetValue(oTSInst, "SundayLeave", Nothing)
                    End If

                Else
                    If key.Contains("2dayStartTimeicon") Then
                        SetValue(oTSInst, "MondayStartTime", Request.Form(key).ToString)
                    End If
                    If key.Contains("2dayBreakStarticon") Then
                        SetValue(oTSInst, "MondayBreakStart", Request.Form(key).ToString)
                    End If
                    If key.Contains("2dayBreakFinishicon") Then
                        SetValue(oTSInst, "MondayBreakFinish", Request.Form(key).ToString)
                    End If
                    If key.Contains("2dayFinishTimeicon") Then
                        SetValue(oTSInst, "MondayFinishTime", Request.Form(key).ToString)
                    End If
                    If key.Contains("2dayHoursSubTotal") Then
                        SetValue(oTSInst, "MondayTotal", Request.Form(key).ToString)
                    End If
                    If key.Contains("2dayDayofLeavevalue") Then
                        SetValue(oTSInst, "MondayLeave", Request.Form(key).ToString)
                    End If

                    If key.Contains("3dayStartTimeicon") Then
                        SetValue(oTSInst, "TuesdayStartTime", Request.Form(key).ToString)
                    End If
                    If key.Contains("3dayBreakStarticon") Then
                        SetValue(oTSInst, "TuesdayBreakStart", Request.Form(key).ToString)
                    End If
                    If key.Contains("3dayBreakFinishicon") Then
                        SetValue(oTSInst, "TuesdayBreakFinish", Request.Form(key).ToString)
                    End If
                    If key.Contains("3dayFinishTimeicon") Then
                        SetValue(oTSInst, "TuesdayFinishTime", Request.Form(key).ToString)
                    End If
                    If key.Contains("3dayHoursSubTotal") Then
                        SetValue(oTSInst, "TuesdayTotal", Request.Form(key).ToString)
                    End If

                    If key.Contains("4dayStartTimeicon") Then
                        SetValue(oTSInst, "WednesdayStartTime", Request.Form(key).ToString)
                    End If
                    If key.Contains("4dayBreakStarticon") Then
                        SetValue(oTSInst, "WednesdayBreakStart", Request.Form(key).ToString)
                    End If
                    If key.Contains("4dayBreakFinishicon") Then
                        SetValue(oTSInst, "WednesdayBreakFinish", Request.Form(key).ToString)
                    End If
                    If key.Contains("4dayFinishTimeicon") Then
                        SetValue(oTSInst, "WednesdayFinishTime", Request.Form(key).ToString)
                    End If
                    If key.Contains("4dayHoursSubTotal") Then
                        SetValue(oTSInst, "WednesdayTotal", Request.Form(key).ToString)
                    End If

                    If key.Contains("5dayStartTimeicon") Then
                        SetValue(oTSInst, "ThursdayStartTime", Request.Form(key).ToString)
                    End If
                    If key.Contains("5dayBreakStarticon") Then
                        SetValue(oTSInst, "ThursdayBreakStart", Request.Form(key).ToString)
                    End If
                    If key.Contains("5dayBreakFinishicon") Then
                        SetValue(oTSInst, "ThursdayBreakFinish", Request.Form(key).ToString)
                    End If
                    If key.Contains("5dayFinishTimeicon") Then
                        SetValue(oTSInst, "ThursdayFinishTime", Request.Form(key).ToString)
                    End If
                    If key.Contains("5dayHoursSubTotal") Then
                        SetValue(oTSInst, "ThursdayTotal", Request.Form(key).ToString)
                    End If

                    If key.Contains("6dayStartTimeicon") Then
                        SetValue(oTSInst, "FridayStartTime", Request.Form(key).ToString)
                    End If
                    If key.Contains("6dayBreakStarticon") Then
                        SetValue(oTSInst, "FridayBreakStart", Request.Form(key).ToString)
                    End If
                    If key.Contains("6dayBreakFinishicon") Then
                        SetValue(oTSInst, "FridayBreakFinish", Request.Form(key).ToString)
                    End If
                    If key.Contains("6dayFinishTimeicon") Then
                        SetValue(oTSInst, "FridayFinishTime", Request.Form(key).ToString)
                    End If
                    If key.Contains("6dayHoursSubTotal") Then
                        SetValue(oTSInst, "FridayTotal", Request.Form(key).ToString)
                    End If

                    If key.Contains("7dayStartTimeicon") Then
                        SetValue(oTSInst, "SaturdayStartTime", Request.Form(key).ToString)
                    End If
                    If key.Contains("7dayBreakStarticon") Then
                        SetValue(oTSInst, "SaturdayBreakStart", Request.Form(key).ToString)
                    End If
                    If key.Contains("7dayBreakFinishicon") Then
                        SetValue(oTSInst, "SaturdayBreakFinish", Request.Form(key).ToString)
                    End If
                    If key.Contains("7dayFinishTimeicon") Then
                        SetValue(oTSInst, "SaturdayFinishTime", Request.Form(key).ToString)
                    End If
                    If key.Contains("7dayHoursSubTotal") Then
                        SetValue(oTSInst, "SaturdayTotal", Request.Form(key).ToString)
                    End If

                    If key.Contains("1dayStartTimeicon") Then
                        SetValue(oTSInst, "SundayStartTime", Request.Form(key).ToString)
                    End If
                    If key.Contains("1dayBreakStarticon") Then
                        SetValue(oTSInst, "SundayBreakStart", Request.Form(key).ToString)
                    End If
                    If key.Contains("1dayBreakFinishicon") Then
                        SetValue(oTSInst, "SundayBreakFinish", Request.Form(key).ToString)
                    End If
                    If key.Contains("1dayFinishTimeicon") Then
                        SetValue(oTSInst, "SundayFinishTime", Request.Form(key).ToString)
                    End If
                    If key.Contains("1dayHoursSubTotal") Then
                        SetValue(oTSInst, "SundayTotal", Request.Form(key).ToString)
                    End If
                End If

            Next
            'Submitting
            If GetValue(oTSInst, "Contact.EmailTimesheets") Then
                SetValue(oTSInst, "SendNotificationToContact", True)
            End If
            If GetValue(oTSInst, "job.jobratebasis") Then
                If (GetValue(oTSInst, "MondayTotal") > 0.1 And (GetValue(oTSInst, "MondayTotal") < 3 Or GetValue(oTSInst, "MondayTotal") > 10.1)) Or (GetValue(oTSInst, "TuesdayTotal") > 0.1 And (GetValue(oTSInst, "TuesdayTotal") < 3 Or GetValue(oTSInst, "TuesdayTotal") > 10.1)) Or (GetValue(oTSInst, "WednesdayTotal") > 0.1 And (GetValue(oTSInst, "WednesdayTotal") < 3 Or GetValue(oTSInst, "WednesdayTotal") > 10.1)) Or (GetValue(oTSInst, "ThursdayTotal") > 0.1 And (GetValue(oTSInst, "ThursdayTotal") < 3 Or GetValue(oTSInst, "ThursdayTotal") > 10.1)) Or (GetValue(oTSInst, "FridayTotal") > 0.1 And (GetValue(oTSInst, "FridayTotal") < 3 Or GetValue(oTSInst, "FridayTotal") > 10.1)) Or (GetValue(oTSInst, "SaturdayTotal") > 0.1 And (GetValue(oTSInst, "SaturdayTotal") < 3 Or GetValue(oTSInst, "SaturdayTotal") > 10.1)) Or (GetValue(oTSInst, "SundayTotal") > 0.1 And (GetValue(oTSInst, "SundayTotal") < 3 Or GetValue(oTSInst, "SundayTotal") > 10.1)) Then
                    Using mm As New MailMessage("timesheets@alphajobs.co.nz", GetValue(oTSInst, "Job.Consultant.eMailAddress"))
                        mm.Subject = "Timesheet Alert -" & GetValue(oTSInst, "Candidate.Name.FirstName") & " " & GetValue(oTSInst, "Candidate.Name.LastName")
                        Dim bcc As MailAddress = New MailAddress("support@alphajobs.co.nz")
                        mm.Bcc.Add(bcc)
                        mm.Body = "<html><body style='font-family:Tahoma; font-size:14px; color:#333;'> Hi " & GetValue(oTSInst, "Job.Consultant.eMailAddress.Name.FirstName") & ","
                        mm.Body &= "<br/><br/>" & oTSInst.Candidate.prompt & " has submitted a timesheet for weekending:<b>" & GetValue(oTSInst, "WeekEndingDate") & "</b> for contract job: <b>" & GetValue(oTSInst, "Job.JobId") & "</b> which is a Daily Rate job."
                        mm.Body &= "<br/>This candidate has not worked standard hours on one or more of the days in this week.  Please check, and if necessary edit the <b>Total Days</b> manually. </body></html>"

                        Dim smtp As New SmtpClient()
                        smtp.Host = "10.10.1.29"
                        'smtp.EnableSsl = True
                        'Dim NetworkCred As New NetworkCredential("sender@gamail.com", "password")
                        'smtp.UseDefaultCredentials = True
                        'smtp.Credentials = NetworkCred
                        smtp.Port = 25
                        smtp.Send(mm)
                    End Using
                End If
            End If

                oTSInst.Save(objTransaction)
                objValidate = objTransaction.Validate
                If objValidate.Status <> 3 Then
                    objTransaction.Commit()
                    saved = True
                    Response.Redirect("~/Profile/timesheet/TimesheetDetails.aspx?strTSKey=" + strTSKey1)
                End If
            End If
    End Sub
End Class