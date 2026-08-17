---
name: create-handoff
description: Writes a handoff document so a fresh agent or a colleague can resume work without re-deriving anything. Asks about scope, depth and status with AskUserQuestion, then records the decisions, the evidence behind them, the dead ends, and what to do next. Saves to ~/handoffs/<repo-name> by default. Use this whenever the user asks for a handoff, a handover, a context dump, notes so someone else can pick this up, a summary for a fresh agent, or says they want to park a thread and come back to it later. Also use it when a long investigation is ending and the reasoning would otherwise be lost.
allowed-tools: AskUserQuestion Read Write Grep Glob Bash(git *) Bash(mkdir *) Bash(basename *) Bash(date *)
argument-hint: "[topic, or blank to be asked]"
---

# Create Handoff

Produce a document that lets someone with **no memory of this conversation** continue the work.

## Why this is harder than a summary

The failure mode is a document full of confident conclusions and no evidence. The next agent cannot tell which claims were verified and which were assumed, so it re-runs the whole investigation to find out. That wastes more time than writing nothing.

A handoff earns its keep by carrying three things a summary usually drops:

- **The numbers.** "Reconciliation passed" is worthless. "32 + 12 + 22 + 3 = 69, matching the total row" can be checked in seconds and trusted.
- **The dead ends.** What was tried and failed is as valuable as what worked. Without it the next agent repeats the failure.
- **The mechanics.** How you actually queried the thing, which tool rejected what, which alias worked. This is the tacit knowledge that costs an hour to rediscover.

Keep those and the document is useful even months later.

## Step 1: Ask what is needed

Use **AskUserQuestion**. Three questions, because each answer changes the document's shape. Do not ask about the destination; it has a default (Step 2).

If the user supplied a topic in `$ARGUMENTS`, use it and drop the scope question.

**Scope** — "What should the handoff cover?"
- One topic (name it from context)
- The whole conversation
- Several topics, as separate documents

**Depth** — "How much of the conversation should it carry?"
- Curated findings plus the evidence that supports them *(recommended, and say so)*
- Full verbatim record of the relevant exchanges
- Decisions and next steps only

**Status** — "What state is the work in?"
- Closed: investigated, decision made
- Blocked on someone or something outside our control
- Still in progress, stopping mid-task

Offer a recommendation in the option label where one is genuinely better, so the user can accept the default quickly.

Full-verbatim is the right choice when the *reasoning path* matters and would be flattened by summarising, for example a contested definition where you need to see how the position moved. It is the wrong choice when the conversation was long and exploratory, because the signal drowns.

## Step 2: Resolve the destination

Run the helper, which resolves the repository name and creates the directory:

```bash
scripts/handoff-dir.sh
```

It prints the directory to stdout. Default is `~/handoffs/<repo-name>`, taken from the git top level. Outside a git repository it falls back to the current directory's name. Honour an explicit path if the user gave one.

Filename: `YYYY-MM-DD-<topic-slug>.md`, using today's real date. The date prefix sorts chronologically and stops a second handoff on the same topic silently overwriting the first.

## Step 3: Redact before writing, not after

Scan what you are about to include and remove:

- API keys, tokens, passwords, connection strings, private URLs with credentials in them
- Third-party personal data: names, emails, phone numbers of people outside the team
- Customer or client records quoted as raw rows

This matters most in full-verbatim mode, where a pasted credential or a stack trace containing one travels straight into the document. Where a value must be referenced, describe its role instead: "the API key the user supplied", not the key.

State plainly at the end of the document what was redacted, so the next agent knows something was removed rather than never existed.

## Step 4: Write it

Follow `TEMPLATE.md`. Read it now if you have not.

Adapt the sections to the work. A blocked investigation needs a prominent "what unblocks this" section; a closed one needs the decision and its evidence. Drop sections that would be empty rather than filling them with filler.

Two rules that carry most of the value:

**Reference other artifacts, do not copy them.** Point at file paths, commit hashes, PR URLs and existing docs. Copied content goes stale silently and the reader cannot tell which copy is current. The exception is where the artifact does not exist yet, in which case the evidence has to live here or it lives nowhere.

**Do not mention an issue tracker unless the user asks.** No ticket IDs, no Jira or Linear links. Many handoffs are written before any ticket exists, and a stale reference is worse than none. If the user explicitly wants tickets referenced, cross-link them properly in both directions.

## Step 5: Suggested skills

Close with a section naming the skills the next agent should invoke via the Skill tool, and why each one helps *for this specific work*.

Name only skills that actually exist in the available-skills list. An invented name sends the next agent hunting for something that was never there. If nothing fits, say so and drop the section.

Frame each as a reason rather than a label. "Use `grill-me` before building, because the open question is a definition needing sign-off and a vague agreement produces a metric that gets disputed later" tells the reader when to reach for it. "Use `grill-me`" does not.

## Quality check

Before finishing, reread it as the next agent. Three questions:

1. Could I act on this without opening the original conversation?
2. Can I tell verified facts from assumptions?
3. Do I know what was already tried and failed?

If any answer is no, the gap is usually missing numbers or a missing dead end.

Then tell the user the path, and give a two-line summary of what the document says so they can sanity-check the framing without opening it.
