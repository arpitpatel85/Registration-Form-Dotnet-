# User Registration Form

A classic ASP.NET Web Forms registration page written in C#. The form collects personal and contact details, loads city/state/country choices, and displays registration records in a GridView.

## Features

- Collects name, parent names, gender, email, mobile number, social links, and addresses.
- Loads cities and populates related states and countries.
- Inserts registrations into `MktReg`, displays registrations, and supports deleting a record.

## Project contents

```text
UserRegistrationForm/
  UserRegister.aspx       Registration form markup and styles
  UserRegister.aspx.cs    Page event handlers and database operations
```

## Requirements and setup

This source is an ASP.NET Web Forms page, not a complete standalone project. Run it from an ASP.NET Web Forms application in Visual Studio with a compatible .NET Framework target and IIS Express or IIS.

The checked-in files do not include the application project file, `DbFunctions` implementation, database connection configuration, or database scripts. To run the page:

1. Add the page and code-behind to a Web Forms application.
2. Provide the `DbFunctions` methods used by the page (`FillDropdownlist`, `FillDataTable`, `ExecuteDML`, and `MsgBox`) and configure its database connection.
3. Set up the SQL Server tables expected by the page: `MktReg`, `City`, `State`, and `Country`. The page expects their columns and relationships as referenced in `UserRegister.aspx.cs` (including `City.StateID` and `State.CountryId`).
4. Run the Web Forms application and open `UserRegister.aspx`.

No database schema or connection settings are supplied in this repository; configure these for your environment before running the page.
