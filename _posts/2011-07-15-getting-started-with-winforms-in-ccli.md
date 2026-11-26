---
layout: post
title: Getting Started with WinForms in C++/CLI
excerpt: A walkthrough of the default code generated for a Visual C++ WinForms project
---

Opening a new Visual C++ WinForms project, the first object we see is the designer, which represents a blank form. The designer can be used to add/delete controls, move controls around, and change controls' basic properties such as name, text, background image, etc. More complex operations should be done within the code, however. To change from designer to code, right-click the designer and select "View code".

A form is categorized as a header file. The default form is titled "Form1.h". As a header file, it contains the ubiquitous `#pragma once` preprocessor directive by default, so that the file would be included only once.

All the code used to build the form is included in a namespace, which by default has the same name as the project. DO NOT try to change this namespace's name, because resource files (kept in `Form1.resX`) use the project name as part of their identifiers. If the namespace name does not match the project name, the resource file won't be found. I learned this lesson the hard way[^1].

Default namespaces are included. To make my Student RecordKeeper project, I included two other useful namespaces:

```cpp
using namespace System::IO;
using namespace System::Collections::Generic;
```

`System::IO` is useful for opening, reading, writing to, and closing text files. `System::Collections::Generic` is useful for using generic collections such as `List` and `Dictionary`.

`Form1` is an instance of the `System::Windows::Forms::Form` class. As I understand it, in C++/CLI `ref class` is used to indicate that a class is managed. The default constructor and destructor follow.

The most interesting part of the code is the `InitializeComponent()` function. When I first began working with a WinForms project, I kept writing code in the body of the function and wondered why the designer would stop working. Well, turns out you shouldn't ignore big, multi-line warning comments ;). The `InitializeComponent()` function is used by the designer and is automatically updated. In short, don't touch anything within the function[^2].

That's a pretty thorough introduction to a default WinForms application, I think. The full code can be seen below.

```cpp
#pragma once

namespace Example_GettingStarted_WinForms {

	using namespace System;
	using namespace System::ComponentModel;
	using namespace System::Collections;
	using namespace System::Windows::Forms;
	using namespace System::Data;
	using namespace System::Drawing;

	/// <summary>
	/// Summary for Form1
	///
	/// WARNING: If you change the name of this class, you will need to change the
	/// 'Resource File Name' property for the managed resource compiler tool
	/// associated with all .resx files this class depends on. Otherwise,
	/// the designers will not be able to interact properly with localized
	/// resources associated with this form.
	/// </summary>
	public ref class Form1 : public System::Windows::Forms::Form
	{
	public:
		Form1(void)
		{
			InitializeComponent();
			//
			//TODO: Add the constructor code here
			//
		}

	protected:
		/// <summary>
		/// Clean up any resources being used.
		/// </summary>
		~Form1()
		{
			if (components)
			{
				delete components;
			}
		}

	private:
		/// <summary>
		/// Required designer variable.
		/// </summary>
		System::ComponentModel::Container ^components;

#pragma region Windows Form Designer generated code
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		void InitializeComponent(void)
		{
			this->SuspendLayout();
			//
			// Form1
			//
			this->AutoScaleDimensions = System::Drawing::SizeF(8, 16);
			this->AutoScaleMode = System::Windows::Forms::AutoScaleMode::Font;
			this->ClientSize = System::Drawing::Size(586, 373);
			this->Name = L"Form1";
			this->Text = L"Form1";
			this->ResumeLayout(false);

		}
#pragma endregion
	};
}
```

---

[^1]: As mentioned in a previous post, I began my project (which I called `Schedule_UI`, even though it's not really a personal schedule maker but rather a grade recorder) in VS2010 and discovered that there is no Intellisense support for C++/CLI, so I ported my project over to VS2008. Well, when I created a new project for VS2008, I named it `Schedule_UI_2008`. When I copy-pasted my code from the VS2010 project into the VS2008 project, I kept the namespace as `Schedule_UI`. Everything worked just fine until I tried to add a background image to a button. The program simply could not find the image resource, even though it was clearly located in the `Form1.resX` resource file. Took me a _long_ time before I found the answer.

[^2]: Note that the `InitializeComponent()` function is surrounded by the pair of directives `#pragma region`/`#pragma endregion`. This allows the code between the directives to be collapsed, and is useful for creating user-defined regions of code. However, there is a big disadvantage to doing this: functions within the region can no longer be collapsed! See [here](http://connect.microsoft.com/VisualStudio/feedback/details/654313/outlining-in-a-pragma-region-block-disappears) for more information. Although the issue in the link was reported in 2011, this problem has existed since VS2005 and I've seen several Microsoft responses claiming that it would be fixed in a patch for VS2005, then in VS2008, then finally in VS2010. So I wouldn't hold my breath for it to be fixed in VS2012 or whatever the next version of Visual Studio becomes.
