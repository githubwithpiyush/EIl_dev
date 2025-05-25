﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="BulkSMSWebApp.Home" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>E.I.L. Employee Reach Bulk SMS</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        .form-label {
            font-weight: 600;
        }

        .form-section {
            margin-bottom: 20px;
        }

        .inline-dropdowns > div {
            margin-right: 15px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Logout Button -->
        <div style="position: absolute; top: 10px; right: 20px;">
            <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="btn btn-danger btn-sm" OnClick="btnLogout_Click" />
        </div>

        <div class="container mt-4">
            <!-- Logo + Header -->
            <div class="d-flex align-items-center gap-3 mb-3">
                <img src="Content/eillogopn.png" alt="EIL Logo" style="height: 50px;" />
                <h3 class="text-primary mb-0">E.I.L. Employee Reach Bulk SMS</h3>
            </div>

            <asp:Label ID="lblWelcome" runat="server" CssClass="form-text d-block mb-3 fw-bold text-success"></asp:Label>
            <asp:HiddenField ID="hdnMessageId" runat="server" />

            <!-- Directorate, Division, Department -->
            <div class="form-section d-flex flex-wrap inline-dropdowns">
                <div>
                    <label class="form-label">Directorate</label>
                    <asp:DropDownList ID="ddlDirectorate" runat="server" AutoPostBack="true"
                        OnSelectedIndexChanged="ddlDirectorate_SelectedIndexChanged" CssClass="form-select">
                    </asp:DropDownList>
                </div>
                <div>
                    <label class="form-label">Division</label>
                    <asp:DropDownList ID="ddlDivision" runat="server" AutoPostBack="true"
                        OnSelectedIndexChanged="ddlDivision_SelectedIndexChanged" CssClass="form-select">
                    </asp:DropDownList>
                </div>
                <div>
                    <label class="form-label">Department</label>
                    <asp:DropDownList ID="ddlDepartment" runat="server" AutoPostBack="true"
                        OnSelectedIndexChanged="ddlDepartment_SelectedIndexChanged" CssClass="form-select">
                    </asp:DropDownList>
                </div>
            </div>

            <!-- Templates -->
            <div class="form-section">
                <label class="form-label">Select Section</label>
                <asp:DropDownList ID="ddlTemplates" runat="server" AutoPostBack="true"
                    OnSelectedIndexChanged="ddlTemplates_SelectedIndexChanged" CssClass="form-select">
                </asp:DropDownList>
            </div>

            <!-- Dates and Times -->
            <div class="row form-section">
                <div class="col-md-3">
                    <label class="form-label">From Date</label>
                    <asp:TextBox ID="txtFromDate" runat="server" TextMode="Date" CssClass="form-control" />
                </div>
                <div class="col-md-3">
                    <label class="form-label">From Time</label>
                    <asp:TextBox ID="txtFromTime" runat="server" TextMode="Time" CssClass="form-control" />
                </div>
                <div class="col-md-3">
                    <label class="form-label">To Date</label>
                    <asp:TextBox ID="txtToDate" runat="server" TextMode="Date" CssClass="form-control" />
                </div>
                <div class="col-md-3">
                    <label class="form-label">To Time</label>
                    <asp:TextBox ID="txtToTime" runat="server" TextMode="Time" CssClass="form-control" />
                </div>
            </div>

            <!-- Venue, Level & Location in One Line -->
            <div class="form-section d-flex gap-3">
                <!-- Venue -->
                <div style="flex: 1;">
                    <label class="form-label" for="txtVenue">Venue</label>
                    <asp:TextBox ID="txtVenue" runat="server" CssClass="form-control" placeholder="Enter venue..."></asp:TextBox>
                </div>

                <!-- Level -->
                <div style="flex: 1;">
                    <label class="form-label" for="ddlLevel">Level</label>
                    <asp:DropDownList ID="ddlLevel" runat="server"
                        AutoPostBack="true"
                        OnSelectedIndexChanged="ddlLevel_SelectedIndexChanged" CssClass="form-select">
                    </asp:DropDownList>
                </div>

                <!-- Location -->
                <div style="flex: 1;">
                    <label class="form-label" for="ddlLocation">Location</label>
                    <asp:DropDownList ID="ddlLocation" runat="server"
                        AutoPostBack="true"
                        OnSelectedIndexChanged="ddlLocation_SelectedIndexChanged" CssClass="form-select">
                    </asp:DropDownList>
                </div>
            </div>




            <!-- Short Description -->
            <%--<div class="form-section">
                <label class="form-label">Short Description</label>
                <asp:TextBox ID="txtShortDescription" runat="server" CssClass="form-control" placeholder="Enter a short summary..."></asp:TextBox>
            </div>--%>

            <!-- Message -->
            <div class="form-section">
                <label class="form-label">Message</label>
                <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Rows="4" CssClass="form-control" placeholder="Enter your message here..."></asp:TextBox>
            </div>

            <!-- Buttons -->
            <div class="form-section d-flex gap-3">
                <asp:Button ID="btnUpdate" runat="server" Text="Send Message" OnClick="btnUpdate_Click" CssClass="btn btn-success" />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" CssClass="btn btn-outline-secondary" CausesValidation="false" />
            </div>
        </div>
    </form>
</body>
</html>