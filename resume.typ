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
    size: 10pt, // Reduced from 11pt
    lang: "en",
    ligatures: false,
  )
  set page(
    margin: 0.4in, // Reduced from 0.5in
    "us-letter",
  )
  set par(
    leading: 0.4em, // Reduced line spacing
    spacing: 0.4em, // Reduced paragraph spacing
  )
  show link: underline
  show heading.where(level: 2): it => [
    #pad(top: 2pt, bottom: -8pt, [#smallcaps(it.body)]) // Reduced padding
    #line(length: 100%, stroke: 0.8pt) // Thinner line
  ]
  show heading: set text(fill: rgb(accent-color))
  show link: set text(fill: rgb(accent-color))
  show heading.where(level: 1): it => [
    #set align(left)
    #set text(
      weight: 700,
      size: 18pt, // Reduced from 20pt
    )
    #it.body
  ]

      box(
        width: 100%,
        align(center)[
          // Name and title
          #text(
            size: 18pt, // Reduced from 20pt
            weight: "bold",
            fill: rgb("#26428b"),
            [#(author)],
          )

          // Contact information (moved from below to here)
          #pad(
            top: 2pt, // Reduced padding
            [
              #(
                (
                  if phone != "" {
                    phone
                  },
                  if location != "" {
                    location
                  },
                  if email != "" {
                    link("mailto:" + email)[Email]

                  },
                  if github != "" {
                    link("https://" + github)[Github]
                  },
                  if linkedin != "" {
                    link("https://" + linkedin)[Linkedin]
                  },
                  if personal-site != "" {
                    link("https://" + personal-site)[Portfolio]
                  },
                )
                  .filter(x => x != none)
                  .join("  |  ")
              )
            ],
          )

          #pad(
            top: 2pt,
            [Full Stack Engineer with a strong interest in software architecture,\
             performance optimization, and Kubernetes infrastructure management.],
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
  pad(top: 2pt, bottom: 2pt)[
    // Reduced padding
    #top-left #h(1fr) #top-right \
    #bottom-left #h(1fr) #bottom-right
  ]
}

#let generic-one-by-two(
  left: "",
  right: "",
) = {
  pad(top: 2pt, bottom: 2pt)[
    // Reduced padding
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
  generic-two-by-two(top-left: strong(institution), top-right: dates, bottom-left: emph(degree), bottom-right: emph(
    location,
  ))
}

#let work(
  title: "",
  dates: "",
  company: "",
  location: "",
) = {
  generic-two-by-two(top-left: strong(company), top-right: dates, bottom-left: emph(title), bottom-right: emph(location))
}

#let project(
  role: "",
  name: "",
  url: "",
  dates: "",
) = {
  pad(top: 2pt, bottom: 2pt)[
    // Reduced padding
    *#role*, #name #if (url != "") {"(" + (link(url)[Github]) + ")"} #h(1fr) #dates
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

== Professional Experience

#work(
  title: "Full Stack Engineer",
  dates: dates-helper(start-date: "Sept 2023", end-date: "Sept 2025"),
  company: "Stiilt",
  location: "Nice, France",
)

Design, development, and operation of complex web and mobile applications in a dynamic startup environment:
- Architecture and implementation of *full stack* solutions using *Angular* and *NestJS*, handling both frontend user interfaces and backend API development
- Maintenance and optimization of *iOS* and *Android* mobile applications, ensuring cross-platform compatibility and performance
- Management and debugging of *Kubernetes* infrastructures, including container orchestration and deployment pipelines
- Performance optimization across web and mobile platforms, achieving a 40% reduction in loading times through code refactoring and caching strategies
- Collaboration with product teams to deliver scalable solutions meeting business requirements and user needs
- Design and development of client facing website that gives client access to a dashboard that allows him to view and interact with their entire fleet in the case that they rent multiple vehicles. Features include real-time location of all vehicles, ability to add or remove driver access to the vehicle, and the ability to remotely lock/unlock the vehicle.
- Adding the cobadged card compliance to the mobile apps, designing and implementing interfaces that allow users to select their preferred network to process their payments when they add a debit card to their accounts

== Education

#edu(
  institution: "Polytech Nice Sophia",
  dates: dates-helper(start-date: "Sept 2022", end-date: "Sept 2025"),
  degree: "Engineering Degree, Computer Science",
  location: "Sophia Antipolis, France",
)
Relevant coursework: Software architecture, development operations, 3D Animations, Game development, Parallelism, CUDA, Functional Programming, Advanced Algorithms and Turing machines, Advanced networking, Software security, Middleware and Service Oriented Computing, Conception of interactive systems, Multimodal Interaction Techniques.

#edu(
  institution: "IAE Nice",
  dates: dates-helper(start-date: "Sept 2024", end-date: "Sept 2025"),
  degree: "Master's Degree, Management and Business Administration",
  location: "Nice, France",
)
Specialized in management control and financial analysis, with focus on strategic decision-making, and digital transformation.

#edu(
  institution: "Classes Préparatoires aux Grandes Ecoles Settat",
  dates: dates-helper(start-date: "Sept 2020", end-date: "Jul 2022"),
  degree: "Centrale & CCINP Competitions",
  location: "Settat, Morocco",
)
Intensive two years studying Mathematics and Physics among other courses to pass highly competitive entrance exams of prestigious French Engineering schools.

- Mathematics : Real Analysis, General and Linear Algebra, Differential Equations, Probability and Topology.
- Computer Science : Python, SQL, Algorithms and Numerical methods.




== Projects

#project(
  role: "Founder & Lead Engineer",
  name: "Entervio",
  dates: dates-helper(start-date: "Nov 2025", end-date: "Present"),
  url: "https://github.com/Entervio/entervio",
)
AI-powered voice interview platform with real-time speech interaction. Built full-stack with *React* and *FastAPI*, integrating *Gemini*, *Whisper*, and *ElevenLabs* for dynamic interviews with configurable AI personas and detailed feedback.

#project(
  role: "Software Architect & Lead developer",
  name: "DsEasy",
  dates: dates-helper(start-date: "Sep 2023", end-date: "Present"),
  url: "",
)

Exam generation service developed in *Go* and *SQLite*, utilizing *gomigrate*, *SQLc*, and *gorilla/mux*. Development of a robust API with Go, connected to a responsive frontend using *React* and *Tailwindcss* . Continuous integration for seamless updates and management.

#project(
  role: "Lead Developer",
  name: "Budgeteer",
  dates: dates-helper(start-date: "Jul 2024", end-date: "Present"),
  url: "https://github.com/budgeteer-app",
)

Cross-platform shared expense management application developed in *Kotlin* and *Spring Boot*. Development of a robust API with *Kotlin* and *Spring Boot*, connected to a cross-platform mobile application using *Kotlin Multiplatform*. Continuous integration with *GitHub Actions*.



== Technical Skills
- *Programming Languages*: JavaScript, Python, C/C++, Java, Go, Rust, Kotlin
- *Technologies*: React, Svelte, Angular, Spring, NestJS, Tailwind CSS
- *DevOps*: Kubernetes, Docker, Jenkins, GitHub Actions, SonarQube, GitLab, GitLab CI
- *Cloud*: Google Cloud Platform, AWS
- *Competitive Programming*: Top 90 out of 400 in Thales Battledev 2024; Founder of Competitive Coding club at Polytech Marseille and organizer of programming competitions at Polytech Nice.