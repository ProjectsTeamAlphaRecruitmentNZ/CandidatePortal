Imports StayinFront.Engine
Partial Public Class ODocs
    Inherits System.Web.UI.MasterPage
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("Username") Is Nothing Then
            Response.Redirect("http://www.alphaonline.co.nz/JobsOnline/candidatelogin/login.aspx?domain=JobOnline-Candidate&OriginalURL=%2Fjobsonline%2Fcandidate&Retry=0&Timeout=0&Lockout=0")
        Else

            Dim StaticList As Dictionary(Of String, Items) = CreateDict()

            Dim objCandidate As IAeClassInst = GetInstance(SIFConn.TheSystem.This, "Candidate", False, "Username='" + Session("Username") & "'")
            If Not Page.IsPostBack Then


                If objCandidate IsNot Nothing Then
                    Dim testStr As String = ""
                    Dim docsList As New List(Of String)()
                    Dim docPackLib = objCandidate.Folders("CandidateDocPackLibraries").Scan("")
                    For Each docPack In docPackLib
                        'testStr &= GetValue(docPack, "DocumentLibrary.DocumentCode") + ", "
                        'docsList.Add(GetValue(docPack, "DocumentLibrary.DocumentCode"))
                    Next


                    For Each doc In docsList
                        If doc IsNot Nothing Then

                            If StaticList.ContainsKey(doc) Then
                                Dim LinkId As String = StaticList.Item(doc).ID
                                If DocsListControl.FindControl(LinkId) Is Nothing Then

                                    Dim docsLiControl As New HtmlGenericControl
                                    docsLiControl.ID = doc
                                    docsLiControl.TagName = "li"
                                    docsLiControl.Attributes.Add("class", "pad_l profile-navigation__item")

                                    Dim docLinkControl As New HyperLink
                                    docLinkControl.ID = LinkId
                                    docLinkControl.NavigateUrl = StaticList.Item(doc).Link
                                    docLinkControl.Text = StaticList.Item(doc).Name

                                    docsLiControl.Controls.Add(docLinkControl)
                                    DocsListControl.Controls.Add(docsLiControl)
                                End If
                            End If

                        End If

                    Next
                    TestCand.Text = testStr

                End If
            End If
        End If
    End Sub

    Public Function CreateDict() As Dictionary(Of String, Items)
        Dim ListOfCodes As New Dictionary(Of String, Items)
        ListOfCodes.Add("ATP-CCH", New Items With {.ID = "CriminalConviction", .Link = "Tax code declaration.aspx", .Name = "Tax code declaration"})
        ListOfCodes.Add("CPTR", New Items With {.ID = "TaxCodeDeclaration", .Link = "Tax code declaration.aspx", .Name = "Tax code declaration"})

        Return ListOfCodes
    End Function

    Public Class Items
        Public ID As String
        Public Name As String
        Public Link As String
        Public Sub New()
        End Sub
    End Class

    Sub Logout_Click(ByVal sender As Object, ByVal e As EventArgs)
        Session("Username") = Nothing
        Response.Redirect("http://www.alphaonline.co.nz/JobsOnline/candidatelogin/login.aspx?domain=JobOnline-Candidate&OriginalURL=%2Fjobsonline%2Fcandidate")
    End Sub

    'Public ReadOnly Property SIFSystem() As IAeSystem
    '    Get

    '        Return SIFConnection.TheSystem.This
    '    End Get
    'End Property

    'ReadOnly Property CurrentUser() As IAeClassInst
    '    Get
    '        Dim objClient As IAeClient = Nothing
    '        Dim objInst As IAeClassInst = Nothing
    '        Dim objSystem As IAeSystem = Nothing
    '        Try
    '            objSystem = SIFConnection.TheSystem.This
    '            objClient = objSystem.User
    '            objInst = objClient.Object
    '            Return objInst
    '        Finally
    '            objClient = Nothing
    '            objInst = Nothing
    '        End Try
    '    End Get
    'End Property
End Class

