---
title: "Meeting types"
---

{{< notice warning >}}
This is a draft document.
{{< /notice >}}

With growth and sustainability in mind, every OSS project would benefit from holding the following recurring meetings:

- community
- newcomers / open office
- triage
- documentation

Further meetings might be added depending on the current needs of the project. That said, one need not start doing everything at once - it might be chaotic.

## Community Meeting

**A regular sync meeting for the project's maintainers which is open to the community.** Everyone is welcome to attend and contribute to conversations.

👆 this is the version Matplotlib, Pandas use

Alternative versions:

**A regular meeting to share updates on everything that is happening in the community.** Everyone is welcome to attend and contribute to conversations.

👆 this is the version NumPy uses, it is broader

**A regular sync meeting for the maintainers, which is open to the community.** The maintainers define the agenda. However, you're welcome to listen, offer useful input, and if there is time at the end, ask questions.

👆 this is the version scikit-learn uses, it is more narrow

## New Contributors Meeting / Office hours

**A regular meeting to make newcomers feel welcome and get over imposter syndrome.**

- 2-3 maintainers, and when possible a Contributor Experience Lead, welcome new contributors to the project.
- The maintainers can rotate who joins so it’s not a lot of extra work on the regular when the meetings are monthly.
- That said, some projects enjoy this format so much and/or it is a part of their strategy to onboard new maintainers to the project they choose to hols them fortnightly, e.g. NumPy.
- Everyone introduces themselves, so people get to know the person behind the Github handle.
- We answer questions new contributors might have, about their issues or getting started, or take note about who we might direct them to (tag in gitter, or on their issue/PR/email).
- We make sure they know about our communication channels and feel comfortable staying in touch and following up with us, e.g. join our mailing lists, gitter, incubator.
- We clarify what we do, and what we don’t do, e.g. in case someone joins and ask us to assign an issue to them 😉
- We share ways we communicate async and norms or expectations around those.
- Advanced level: consider having maintainers demonstrate how to do something in the meeting, e.g. set up the environment, do a PR for a test, a docstring, etc., record these sessions and post them on youtube as instructional videos you can share later on with new contributors who join and prefer video introductions.
  - Be sure to offer people to mute and turn off their video when recording a session you will post online or with others share later.

## Contributor Experience / Triage Meeting

**This meeting aims to prioritize PRs and issues and make decisions on them.** Communicate and coordinate priorities, suggestions, clarifications, and decisions with contributors and maintainers.

- Maintain labels: add descriptions, if relevant - create automation
- Create regularized responses which the team can share and reuse.
  - This can help reduce bias and assist all maintainers in avoiding errors in repetitive communication work.
  - We recommend maintainers and CE / T members save these into the [github saved replies](https://docs.github.com/en/get-started/writing-on-github/working-with-saved-replies/using-saved-replies)
    - Consider upvoting [this github issue](https://github.com/github/feedback/discussions/4974) to make save replies shared among project members
- Take time, or assign someone(s), to mention if a PR or issue will be discussed in an upcoming meeting when .appropriate, so contributors are aware they can participate in discussion regarding their PRs or issues they opened
- If the scope of the PR is beyond the knowledge or responsibilities of the CE/T group, they escalate the PR to the Community call agenda.
  - If this happens on too many PRs and/too often such that the impact on the community call is noticeable consider the following:
    - More experienced maintainers should consider joining the CE/T temporary to help manage the workload
    - A more experienced maintainer can mentor CE/T member(s) to learn more about the project, so they are empowered to handle more decisions and areas of expertise with time.
- Scikit-learn did [a nice write up](https://github.com/scikit-learn/administrative/blob/master/triage_meetings/2021-12-10.md) of how they defined their triage process here.

## Documentation Meeting

**This meeting reviews progress with documentation PRs and issues, and discussions about documentation projects, e.g. GSOD.** It also welcomes new contributors who want to begin with documentation issues.

- Writing technical documentation requires knowledge of technology as well as the ability to explain well the complex to a variety of audiences. It is useful to hold recurring project documentation meetings to create an opportunity for contributors to exchange ideas for future projects or track progress and make decisions on existing ones.
- English second language speakers might have a barrier to entry when the documentation is only available in English. Providing a welcoming space and communicating that we appreciate contributions regardless of English perfection is important.
- Triage for all DOC issues and PRs
- A dedicated documentation meeting can attract contributors with a unique set of skills that would not find their place in many other project meetings, e.g. front end developers, illustrators, and technical writers.
- It can also be attractive for contributors who are interested in a maintainer pathway which is centred on sphinx development, doc testing, technical writing. Keeping the documentation build in check and the docs up to date as well as creating new formats that support new contributors and users in ways the projects didn't have bandwidth to do before attracting such maintainers

## A Note on Meeting Frequency

When the contributor experience / triage and the documentation meetings are in place, the community meetings can be less frequent, e.g. fortnightly, or even monthly. The core maintainers might choose to attend all meetings, while specialised maintainers or contributors would only go to meetings that are relevant to them. This would reduce the meeting frequency for some/most people.

This is also the case when a contributor or maintainer wants to spin off a team/project meeting, such as a website redesign project. For a certain period you might have a website meeting. Once the new website is launched, that meeting would no longer be necessary.

## Website Meeting

**This meeting is for discussion on website development, design, and maintenance.** It also welcomes newcomers who want to begin with website issues.

- Website development is technical but also requires UX and graphical design as well as technical writing. This work benefits from in sync communication, while a major development effort is ongoing. Otherwise, the work can be a part of the regular community and triage meetings.
- English second language speakers might have a barrier to entry with writing in English. Providing a welcoming space and communicating that we appreciate contributions regardless of English perfection is important.
- Triage for all WEB issues and PRs
- A dedicated website meeting can attract contributors with a unique set of skills that would not find their place in (m)any other project meeting, e.g. front end developers, graphical designers, UX/HCI designers, illustrators, technical writers.
