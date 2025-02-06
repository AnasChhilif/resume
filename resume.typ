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
  align(horizon, [= #(author), Full Stack Engineer])
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
#let name = "Anas Chhilif"
#let location = "Nice, France"
#let email = "chhilifanas@gmail.com"
#let github = "github.com/anaschhilif"
#let phone = "+33 7 83 39 17 91"
#let personal-site = "chhilif.com"
#let linkedin = "www.linkedin.com/in/anas-chhilif/"

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

Computer Science Engineer, Polytech Nice Sophia
Seeking a full-time position starting September 2025

== Professional Experience

#work(
  title: "Full Stack Engineer",
  dates: dates-helper(start-date: "Sept 2023", end-date: "Present"),
  company: "Stiilt, SAS",
  location: "Nice, France",
)

Development and deployment of complex web applications in a dynamic startup environment:
- Architecture and implementation of *full stack* solutions for critical applications using *Angular* and *Nestjs*
- Maintenance and debugging of *Kubernetes* infrastructures
- Application performance improvement, reducing loading times by 40%

#work(
  title: "Software Engineer",
  dates: dates-helper(start-date: "Jul 2023", end-date: "Aug 2023"),
  company: "INFOGERANCE ET INGENIERIE INFORMATIQUE",
  location: "Fez, Morocco",
)
Development of an inventory management application using *ReactJS* and *FastAPI*, resulting in a 30% reduction in order processing time.

== Education

#edu(
  institution: "Polytech Nice Sophia",
  dates: dates-helper(start-date: "Sept 2022", end-date: "Sept 2025"),
  degree: "Engineering Degree, Computer Science",
  location: "Sophia Antipolis, France",
)

#edu(
  institution: "Preparatory Classes for Engineering Schools Settat",
  dates: dates-helper(start-date: "Sept 2020", end-date: "Jul 2022"),
  degree: "CCINP Competition Ranking 165/1300",
  location: "Settat, Morocco",
)

== Projects

#project(
  role: "Lead Developer",
  name: "Budgeteer",
  dates: dates-helper(start-date: "Jul 2024", end-date: "Present"),
  url: "github.com/anaschhilif/budgeteer",
)

Cross-platform shared expense management application developed with *Kotlin* and *Spring Boot*. Development of a robust API using *Kotlin* and *Spring Boot*, connected to a cross-platform mobile application using *Kotlin Multiplatform*. Continuous integration with *GitHub Actions*.

#project(
  role: "Lead Developer",
  name: "MusicMan",
  dates: dates-helper(start-date: "Jun 2024", end-date: "Present"),
  url: "github.com/anaschhilif/music-man",
)
Innovative music control application developed in *Rust*.

== Extracurricular Activities
Founder of Sharkoders and organizer of programming competitions at Polytech Nice, promoting algorithmic culture and collaborative development.

== Skills
- *Languages*: JavaScript, Python, C/C++, Java, Golang, Rust, Kotlin
- *Technologies*: React, Svelte, Angular, Spring, Nestjs, Tailwind CSS
- *DevOps*: Kubernetes, Docker, Jenkins, GitHub Actions, SonarQube
- *Cloud*: Google Cloud Platform, AWS
- Top 90 out of 400 in the Thales Battledev Competition 2024