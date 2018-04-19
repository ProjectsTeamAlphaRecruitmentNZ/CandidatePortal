Imports StayinFront.Engine

Partial Public Class RefereeControls
    Inherits System.Web.UI.UserControl
    Public Property FirstName() As String
        Get
            Return first_name.Text
        End Get
        Set(ByVal value As String)
            first_name.Text = value
        End Set
    End Property
    Public Property LastName() As String
        Get
            Return last_name.Text
        End Get
        Set(ByVal value As String)
            last_name.Text = value
        End Set
    End Property
    Public Property EmailVal() As String
        Get
            Return email.Text
        End Get
        Set(ByVal value As String)
            email.Text = value
        End Set
    End Property

    Public Property PhoneLandline() As String
        Get
            Return land.Text
        End Get
        Set(ByVal value As String)
            land.Text = value
        End Set
    End Property
    Public Property PhoneMobile() As String
        Get
            Return mobile.Text
        End Get
        Set(ByVal value As String)
            mobile.Text = value
        End Set
    End Property
    Public Property RefereeCompany() As String
        Get
            Return referee_company.Text
        End Get
        Set(ByVal value As String)
            referee_company.Text = value
        End Set
    End Property
    Public Property RefereePosition() As String
        Get
            Return referee_position.Text
        End Get
        Set(ByVal value As String)
            referee_position.Text = value
        End Set
    End Property
    Public Property ReportingRelationship() As String
        Get
            Return reporting_relationship.Text
        End Get
        Set(ByVal value As String)
            reporting_relationship.Text = value
        End Set
    End Property
    Public Property TimesToContact() As String
        Get
            Return times_to_contact.Text
        End Get
        Set(ByVal value As String)
            times_to_contact.Text = value
        End Set
    End Property

    Protected Sub saveReferee_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim objUserName As String = Session("Username")
        Dim objCandidate As IAeClassInst = GetInstance(SIFConn.TheSystem.This, "Candidate", False, "Username='" + Session("Username") & "'")
        saved = False
        Dim objValidate As IAeValidate = Nothing
        Dim objTransaction As IAeTransaction = SIFConn.TheSystem.This.BeginTransaction
        Dim objFolders As IAeFolders = SIFConn.TheSystem.This.Folders
        Dim objFolder As IAeFolder = objFolders("Referee")

        Dim candidateReferees = objCandidate.Folders("Referees")
        If Not objCandidate Is Nothing Then
            Dim newCandReferee As IAeClassInst = candidateReferees.CreateNewInstance
            SetValue(newCandReferee, "Name.FirstName", FirstName)
            SetValue(newCandReferee, "Name.LastName", LastName)
            SetValue(newCandReferee, "Emailaddress.Emailaddress", EmailVal)
            Dim phoneAL As String = PhoneLandline
            phoneAL = phoneAL.Trim()
            If InStr(phoneAL, " ") > 0 Then
                Dim pLS As String() = phoneAL.Split(" ")
                SetValue(newCandReferee, "PhoneNumber.AreaCode", pLS(0))

                Dim num As String = ""
                Dim cout As Integer = pLS.Length - 1
                If cout > 1 Then
                    For index As Integer = 1 To cout
                        num &= pLS(index)
                    Next
                Else
                    num = pLS(1)
                End If
                SetValue(newCandReferee, "PhoneNumber.Number", num)
            Else

                SetValue(newCandReferee, "PhoneNumber.AreaCode", Nothing)
                SetValue(newCandReferee, "PhoneNumber.Number", phoneAL)
            End If

            Dim phoneM As String = PhoneMobile
            phoneM = phoneM.Trim()
            If InStr(phoneM, " ") > 0 Then
                Dim pLS As String() = phoneM.Split(" ")
                SetValue(newCandReferee, "mobileNumber.AreaCode", pLS(0))

                Dim num As String = ""
                Dim cout As Integer = pLS.Length - 1
                If cout > 1 Then
                    For index As Integer = 1 To cout
                        num &= pLS(index)
                    Next
                Else
                    num = pLS(1)
                End If
                SetValue(newCandReferee, "mobileNumber.Number", num)
            Else

                SetValue(newCandReferee, "mobileNumber.AreaCode", Nothing)
                SetValue(newCandReferee, "mobileNumber.Number", phoneM)
            End If

            SetValue(newCandReferee, "RefereeCompany", RefereeCompany)
            SetValue(newCandReferee, "RefereePosition", RefereePosition)
            SetValue(newCandReferee, "RefereeRelationship", ReportingRelationship)
            SetValue(newCandReferee, "RefereeContactTime", TimesToContact)
            SetJoinValue(objCandidate.Key.ToString(), newCandReferee, "Candidate")
            newCandReferee.Save(objTransaction)
            newCandReferee = Nothing
            objCandidate.Save(objTransaction)
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