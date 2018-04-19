Imports StayinFront.Engine

Partial Public Class RefereesControls
    Inherits System.Web.UI.UserControl
    Public Property keyVal() As String
        Get
            Return Key.Value
        End Get
        Set(ByVal value As String)
            Key.Value = value
        End Set
    End Property
    Public Property corner() As String
        Get
            Return CornerNum.InnerHtml
        End Get
        Set(ByVal value As String)
            CornerNum.InnerHtml = value
        End Set
    End Property
    Public Property textNumber() As String
        Get
            Return TextNum.InnerHtml
        End Get
        Set(ByVal value As String)
            TextNum.InnerText = value
        End Set
    End Property
    Public Property FirstNames() As String
        Get
            Return first_names.Text
        End Get
        Set(ByVal value As String)
            first_names.Text = value
        End Set
    End Property
    Public Property LastNames() As String
        Get
            Return last_names.Text
        End Get
        Set(ByVal value As String)
            last_names.Text = value
        End Set
    End Property
    Public Property EmailVals() As String
        Get
            Return emails.Text
        End Get
        Set(ByVal value As String)
            emails.Text = value
        End Set
    End Property

    Public Property PhoneLandlines() As String
        Get
            Return lands.Text
        End Get
        Set(ByVal value As String)
            lands.Text = value
        End Set
    End Property
    Public Property PhoneMobiles() As String
        Get
            Return mobiles.Text
        End Get
        Set(ByVal value As String)
            mobiles.Text = value
        End Set
    End Property
    Public Property RefereeCompanys() As String
        Get
            Return referee_companys.Text
        End Get
        Set(ByVal value As String)
            referee_companys.Text = value
        End Set
    End Property
    Public Property RefereePositions() As String
        Get
            Return referee_positions.Text
        End Get
        Set(ByVal value As String)
            referee_positions.Text = value
        End Set
    End Property
    Public Property ReportingRelationships() As String
        Get
            Return reporting_relationships.Text
        End Get
        Set(ByVal value As String)
            reporting_relationships.Text = value
        End Set
    End Property
    Public Property TimesToContacts() As String
        Get
            Return times_to_contacts.Text
        End Get
        Set(ByVal value As String)
            times_to_contacts.Text = value
        End Set
    End Property

    Protected Sub updateReferees_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles updateReferee.Click
        Dim objUserName As String = Session("Username")
        Dim key As String = keyVal
        Dim objCandidate As IAeClassInst = GetInstance(SIFConn.TheSystem.This, "Candidate", False, "Username='" & Session("Username") & "'")
        saved = False
        Dim objValidate As IAeValidate = Nothing
        Dim existingRef As IAeClassInst


        existingRef = GetInstance(SIFConn.TheSystem.This, "Referee", False, "key='" & key & "'")

        Dim objTransaction As IAeTransaction = SIFConn.TheSystem.This.BeginTransaction
        Dim objFolders As IAeFolders = SIFConn.TheSystem.This.Folders

        Dim unavTime = objCandidate.Folders("Referees")
        If Not objCandidate Is Nothing Then
            Dim oUnRefInst As IAeClassInst

            oUnRefInst = existingRef
            SetValue(oUnRefInst, "Name.FirstName", FirstNames)
            SetValue(oUnRefInst, "Name.LastName", LastNames)
            SetValue(oUnRefInst, "Emailaddress.Emailaddress", EmailVals)
            Dim phoneM As String = PhoneMobiles
            phoneM = phoneM.Trim()
            If InStr(phoneM, " ") > 0 Then
                Dim pLS As String() = phoneM.Split(" ")
                SetValue(oUnRefInst, "mobileNumber.AreaCode", pLS(0))

                Dim num As String = ""
                Dim cout As Integer = pLS.Length - 1
                If cout > 1 Then
                    For index As Integer = 1 To cout
                        num &= pLS(index)
                    Next
                Else
                    num = pLS(1)
                End If
                SetValue(oUnRefInst, "mobileNumber.Number", num)
            Else

                SetValue(oUnRefInst, "mobileNumber.AreaCode", Nothing)
                SetValue(oUnRefInst, "mobileNumber.Number", phoneM)
            End If
            Dim phoneAL As String = PhoneLandlines
            phoneAL = phoneAL.Trim()
            If InStr(phoneAL, " ") > 0 Then
                Dim pLS As String() = phoneAL.Trim().Split(" ")
                SetValue(oUnRefInst, "PhoneNumber.AreaCode", pLS(0))

                Dim num As String = ""
                Dim cout As Integer = pLS.Length - 1
                If cout > 1 Then
                    For index As Integer = 1 To cout
                        num &= pLS(index)
                    Next
                Else
                    num = pLS(1)
                End If
                SetValue(oUnRefInst, "PhoneNumber.Number", num)
            Else
                SetValue(oUnRefInst, "PhoneNumber.AreaCode", Nothing)
                SetValue(oUnRefInst, "PhoneNumber.Number", phoneAL)
            End If


            SetValue(oUnRefInst, "RefereeCompany", RefereeCompanys)
            SetValue(oUnRefInst, "RefereePosition", RefereePositions)
            SetValue(oUnRefInst, "RefereeRelationship", ReportingRelationships)
            SetValue(oUnRefInst, "RefereeContactTime", TimesToContacts)

            SetJoinValue(objCandidate.Key.ToString(), oUnRefInst, "Candidate")
            oUnRefInst.Save()
            objValidate = objTransaction.Validate
            If objValidate.Status <> 3 Then
                objTransaction.Commit()
                saved = True
                Response.Redirect(HttpContext.Current.Request.Url.ToString(), True)
            Else
                objTransaction = Nothing
                saved = False
            End If
            objTransaction = Nothing
            objValidate = Nothing
        End If
    End Sub

End Class