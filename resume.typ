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

  // Sets document metadata
  set document(author: author, title: author)

  // Document-wide formatting, including font and margins
  set text(
    // LaTeX style font
    font: "New Computer Modern",
    size: 10pt,
    lang: "en",
    // Disable ligatures so ATS systems do not get confused when parsing fonts.
    ligatures: false
  )

  // Reccomended to have 0.5in margin on all sides
  set page(
    margin: (0.5in),
    "us-letter",
  )


  // Link styles
  show link: underline


  // Small caps for section titles
  show heading.where(level: 2): it => [
    #pad(top: 0pt, bottom: -10pt, [#smallcaps(it.body)])
    #line(length: 100%, stroke: 1pt)
  ]

  // Accent Color Styling
  show heading: set text(
    fill: rgb(accent-color),
  )

  show link: set text(
    fill: rgb(accent-color),
  )

  // Name will be aligned left, bold and big
  show heading.where(level: 1): it => [
    #set align(left)
    #set text(
      weight: 700,
      size: 20pt,
    )
    #it.body
  ]

  // Level 1 Heading
        align(horizon, [= #(author)])

  // Personal Info
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

  // Main body.
  set par(justify: true)

  body
}

// Generic two by two component for resume
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

// Generic one by two component for resume
#let generic-one-by-two(
  left: "",
  right: "",
) = {
  pad[
    #left #h(1fr) #right
  ]
}

// Cannot just use normal --- ligature becuase ligatures are disabled for good reasons
#let dates-helper(
  start-date: "",
  end-date: "",
) = {
  start-date + " " + $dash.em$ + " " + end-date
}

// Section components below
#let edu(
  institution: "",
  dates: "",
  degree: "",
  gpa: "",
  location: "",
) = {
  generic-two-by-two(
    top-left: strong(institution),
    top-right: location,
    bottom-left: emph(degree),
    bottom-right: emph(dates),
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

#let name = "Anas Chhilif"
#let location = "Nice, France"
#let email = "chhilifanas@gmail.com"
#let github = "github.com/anaschhilif"
#let phone = "+33 7 83 39 17 91"
#let personal-site = "chhilif.com"

#show: resume.with(
  author: name,
  // All the lines below are optional. 
  // For example, if you want to to hide your phone number:
  // feel free to comment those lines out and they will not show.
  location: location,
  email: email,
  github: github,
  phone: phone,
  personal-site: personal-site,
  accent-color: "#26428b",
)
Fullstack Engineering Apprentice | 5th Year Computer Science, Polytech Nice Sophia
Seeking Permanent Role from September 2025

== Work Experience


#work(
  title: "Fullstack Engineer, Apprentice",
  location: "Nice, France",
  company: "Stiilt, SAS",
  dates: dates-helper(start-date: "Sep 2023", end-date: "Present"),
)

- Designed and implemented scalable backend architectures and custom frontends/backends for various clients.

- Contributed to Kubernetes deployment and CI/CD pipelines, enhancing efficiency and troubleshooting complex issues.

#work(
  title: "Software Engineer intern",
  location: "Fes, Morocco",
  company: "INFOGERANCE ET INGENIERIE INFORMATIQUE",
  dates: dates-helper(start-date: "Jul 2023", end-date: "Aug 2023"),
)
- Developed and maintained an internal product using ReactJS for the frontend.

- Built and maintained the backend server and its API using Python FastAPI.

== Education

#edu(
  institution: "Polytech Nice Sophia",
  location: "Sophia Antipolis, Fr",
  dates: dates-helper(start-date: "Sep 2023", end-date: "Sep 2025"),
  degree: "Master's of engineering, computer science",
)
- Relevant Coursework: Software architecture, Devops, Middleware and service oriented computing, Machine learning, Software Security, Advanced Networking, Advanced algorithmics, Computation theory.

#edu(
  institution: "IAE Nice",
  location: "Nice, Fr",
  dates: dates-helper(start-date: "Sep 2024", end-date: "Sep 2025"),
  degree: "Master's of Management",
)
- Relevant Coursework: Effective management, International Management, Sustainable business models.


== Projects

#project(
  role: "Core maintainer",
  name: "Budgeteer",
  dates: dates-helper(start-date: "Jul 2024", end-date: "Present"),
  url: "github.com/anaschhilif/budgeteer",
)
- Developed and maintained Budgeteer, a cross-platform Kotlin app with Kotlin Spring Boot backend, using Jetpack Compose and CI/CD with GitHub Actions, to help roommates manage shared expenses.

#project(
  role: "Core maintainer",
  name: "MusicMan",
  dates: dates-helper(start-date: "Jun 2024", end-date: "Present"),
  url: "github.com/anaschhilif/music-man",
)
- Write an application to be able to play music and control it using vim-like bindings, built totally in rust.


== Extracurricular Activities

#extracurriculars(
  activity: "Competitive programming",
  dates: dates-helper(start-date: "Jan 2021", end-date: "Present"),
)
- Founder of Sharkoders, a competitive programming club at Polytech Marseille, where we gave students courses on algorithms and organized mock competitions to practice
- Organized mock progamming competitions in Polytech Nice for the BDT association where students competed against each other on the online platrform Kattis

// #extracurriculars(
//   activity: "Science Olympiad Volunteering",
//   dates: "Sep 2023 --- Present"
// )
// - Volunteer and write tests for tournaments, including LA Regionals and SoCal State \@ Caltech

== Skills and Awards
- *Programming Languages*: JavaScript, Python, C/C++, HTML/CSS, Java, Bash, R, Golang, Rust, Kotlin. 
- *Technologies*: React, Svelte, Tailwind CSS, Git, UNIX, Google Cloud Platform, Angular, Spring, Nestjs.
- *Devops*: Jenkins, Github actions, Github workers, Kubernetes, Docker, Caddy, NGINX, SonarQube, Artifactory.
- Ranked 66/200 in the 2020 edition of MCPC
- Ranked 90/400 in the 2024 Thales Battledev Competition