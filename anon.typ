#let resume(
  author: "",
  location: "",
  email: "",
  github: "",
  linkedin: "",
  phone: "",
  personal-site: "",
  accent-color: "#000000",
  body,
) = {
  set document(author: author, title: author)
  set text(
    font: "New Computer Modern",
    size: 11pt,
    lang: "en",
    ligatures: false
  )
  set page(
    margin: (0.5in),
    "us-letter",
  )
  show link: underline
  show heading.where(level: 2): it => [
    #pad(top: 0pt, bottom: -10pt, [#smallcaps(it.body)])
    #line(length: 100%, stroke: 1pt)
  ]
  show heading: set text(
    fill: rgb(accent-color),
  )
  show link: set text(
    fill: rgb(accent-color),
  )
  show heading.where(level: 1): it => [
    #set align(left)
    #set text(
      weight: 700,
      size: 20pt,
    )
    #it.body
  ]
  
 box(
  grid(
    columns: (auto, auto),
    gutter: 0.5cm,
    align: horizon,
    
    // Image in the first column with changed photo
    /*
    box[#image("photo2.png", width: 2cm)],
    */
    
    // Text in the second column with updated size and color format
    box(
      text(
        size: 20pt, 
        weight: "bold",
        fill: rgb("#26428b"),
        [#(author), Full Stack Engineer]
      )
    )
  )
) 
  
  pad(
    top: 0.25em,
    align(left)[
      #(
        (
          if phone != "" {
            phone
          },
          if location != "" {
            location
          },
          if email != "" {
            link("mailto:" + email)[#email]
          },
          if github != "" {
            link("https://" + github)[#github]
          },
          if linkedin != "" {
            link("https://" + linkedin)[#linkedin]
          },
          if personal-site != "" {
            link("https://" + personal-site)[#personal-site]
          },
        ).filter(x => x != none).join("  |  ")
      )
    ],
  )
  set par(justify: true)
  body
}

#let generic-two-by-two(
  top-left: "",
  top-right: "",
  bottom-left: "",
  bottom-right: "",
) = {
  pad[
    #top-left #h(1fr) #top-right \
    #bottom-left #h(1fr) #bottom-right
  ]
}

#let generic-one-by-two(
  left: "",
  right: "",
) = {
  pad[
    #left #h(1fr) #right
  ]
}

#let dates-helper(
  start-date: "",
  end-date: "",
) = {
  start-date + " " + $dash.em$ + " " + end-date
}

#let edu(
  institution: "",
  dates: "",
  degree: "",
  location: "",
) = {
  generic-two-by-two(
    top-left: strong(institution),
    top-right: dates,
    bottom-left: emph(degree),
    bottom-right: emph(location),
  )
}

#let work(
  title: "",
  dates: "",
  company: "",
  location: "",
) = {
  generic-two-by-two(
    top-left: strong(title),
    top-right: dates,
    bottom-left: company,
    bottom-right: emph(location),
  )
}

#let project(
  role: "",
  name: "",
  url: "",
  dates: "",
) = {
  pad[
    *#role*, #name (#link("https://" + url)[#url]) #h(1fr) #dates
  ]
}

#let extracurriculars(
  activity: "",
  dates: "",
) = {
  generic-one-by-two(
    left: strong(activity),
    right: dates,
  )
}

// Personal Information
#let name = "John Doe"
#let location = "City, Country"
#let email = "john.doe@email.com"
#let github = "github.com/johndoe"
#let phone = "+XX X XX XX XX XX"
#let personal-site = "johndoe.com"
#let linkedin = "www.linkedin.com/in/john-doe/"

#show: resume.with(
  author: name,
  location: location,
  email: email,
  github: github,
  phone: phone,
  personal-site: personal-site,
  linkedin: linkedin,
  accent-color: "#26428b",
)

Software Engineer, University Name.
Looking for a permanent position starting September 2025

== Professional Experience

#work(
  title: "Full Stack Engineer",
  dates: dates-helper(start-date: "Sept 2023", end-date: "Present"),
  company: "Company Name, Inc.",
  location: "City, Country",
)

Development and deployment of complex web applications in a dynamic startup environment:
- Architecture and implementation of *full stack* solutions for applications, using *Angular* and *Nestjs*
- Maintenance and debugging of *Kubernetes* infrastructures
- Improvement of application performance, reducing loading times by 40%

#work(
  title: "Software Engineer",
  dates: dates-helper(start-date: "Jul 2023", end-date: "Aug 2023"),
  company: "TECH SOLUTIONS COMPANY",
  location: "City, Country",
)
Development of an inventory management application using *ReactJS* and *FastAPI*, resulting in a 30% reduction in order processing time.

== Education

#edu(
  institution: "University Name",
  dates: dates-helper(start-date: "Sept 2022", end-date: "Sept 2025"),
  degree: "Engineering Degree, Computer Science",
  location: "City, Country",
)

#edu(
  institution: "Preparatory Classes Institution",
  dates: dates-helper(start-date: "Sept 2020", end-date: "Jul 2022"),
  degree: "Engineering School Entrance Exam ranking 165/1300",
  location: "City, Country",
)

== Projects

#project(
  role: "Lead Developer",
  name: "ExpenseTracker",
  dates: dates-helper(start-date: "Jul 2024", end-date: "Present"),
  url: "github.com/johndoe/expense-tracker",
)

Cross-platform shared expense management application developed in *Kotlin* and *Spring Boot*. Development of a robust API with *Kotlin* and *Spring Boot*, connected to a cross-platform mobile application using *Kotlin Multiplatform*. Continuous integration with *GitHub Actions*.

#project(
  role: "Lead Developer",
  name: "AudioController",
  dates: dates-helper(start-date: "Jun 2024", end-date: "Present"),
  url: "github.com/johndoe/audio-controller",
)
Innovative music control application developed in *Rust*.

== Extracurricular Activities
Founder of Programming Club and organizer of programming competitions at University, promoting algorithmic culture and collaborative development.

== Skills
- *Languages*: JavaScript, Python, C/C++, Java, Golang, Rust, Kotlin
- *Technologies*: React, Svelte, Angular, Spring, Nestjs, Tailwind CSS
- *DevOps*: Kubernetes, Docker, Jenkins, GitHub Actions, SonarQube
- *Cloud*: Google Cloud Platform, AWS
- Top 90 out of 400 in the Tech Company Battledev 2024 Competition