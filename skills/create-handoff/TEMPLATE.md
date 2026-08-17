# Handoff document template

Adapt to the work. Drop any section that would be empty; an empty heading reads as a gap in the investigation rather than an absence of content.

---

```markdown
# Handoff: <topic>

**Status:** <closed, decision made | blocked on X | in progress, stopped at Y>
**Date:** <YYYY-MM-DD>
**Owner:** <name, or "unassigned">

## Why this document exists

The question that was being answered, and why anyone cared. Two or three sentences.
Give the reader enough to judge whether this thread is relevant to them before they
read further.

## Finding

What is actually true, with the numbers that show it. Use a table where the data has
rows and columns.

| Thing measured | Value | Note |
|---|---|---|
| ... | ... | ... |

State the confidence. "Verified against X" and "inferred from Y, not confirmed" are
different claims and the reader cannot tell them apart unless you say which is which.

## What was decided

The decision, and the reasoning in one or two sentences. Include the options that were
rejected and why, because the next agent will otherwise reopen them.

If the decision was provisional or made under time pressure, say so. A decision recorded
as firm when it was a guess is how bad assumptions become load-bearing.

## What is shipping / what is in place now

The current state, so the reader knows what they are inheriting rather than what was
planned. Where behaviour is deliberately limited, say that it is deliberate and where
the limitation is documented.

## What is still open

In the order it should be tackled, with the reason for that order. A bare list invites
the reader to start with the easiest item rather than the one that unblocks the rest.

1. ...
2. ...

## Dead ends

What was tried that did not work, and the evidence that killed it. This is the section
most often skipped and most often needed.

| Tried | Result | Why it fails |
|---|---|---|
| ... | ... | ... |

## Unexplored avenues

Things that might work but were not investigated, and roughly what it would take to find
out. Distinguish these clearly from dead ends: one is untested, the other is disproven.

## References

Paths, commits, PRs and docs, not copies of their contents.

- `path/to/file.ext` — what it holds
- <URL> — what it shows

## Mechanics

How the work was actually done, so the next agent does not rediscover it:

- Which tool or command produced the figures
- Any alias, flag or path that was required and non-obvious
- Anything that was rejected or unavailable, and the error it gave
- Environment quirks: expired auth, missing binaries, permissions

## Suggested skills

Skills the next agent should invoke, with the reason each one fits this work.

- **`skill-name`** — why, and at what point in the work

## Redaction

State what was removed and why, so the reader knows the gap is deliberate.
Confirm no credentials or third-party personal data are present.
```

---

## Notes on filling this in

**Status is the most-read line.** Someone scanning a directory of handoffs decides what to open based on it. "Blocked on RJ configuring lead sources" is useful. "In progress" is not.

**Prefer a number to an adjective.** "The reconstruction loses 43% of the stock" beats "the reconstruction is unreliable", because the reader can decide whether 43% matters for their purpose.

**Say when something surprised you.** A figure that contradicted an expectation is a signal, and the next agent should know it was checked rather than assumed. Record both the expectation and the actual value.
