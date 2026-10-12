# Geometry of Truth

An interactive mystery story written in [ink](https://github.com/inkle/ink), the
scripting language behind inkle's narrative games. This repository holds the
story itself rather than a game engine — the `.ink` files are the source, and
`obsidian_cat.json` is the compiled output that a runtime consumes.

## The story

*The Obsidian Cat* — a mystery in five acts. A gala at the Grand Metropolitan
Museum, forty-seven seconds of darkness, and an Egyptian basalt statue gone from
a case that was blown outward rather than in. You have until sunrise.

It plays as a detective story with real state behind it: clues you either find or
miss, a clock that advances from evening to 10:30 PM to midnight as you work, and
a final accusation that only unlocks once you have enough evidence.

## Files

- `obsidian_cat.ink` — the production script. All the prose, choices, and logic.
- `obsidian_cat.json` — the compiled story, for a runtime to load.
- `obsidian_cat_test.ink`, `obsidian_cat_test_2.ink` — scratch versions used while
  working on branches of the plot.
- `credits_images.txt` — attribution for the Flaticon icons used in the UI.

## How it's put together

The script tracks a fair amount of state, all of it declared at the top of the
`.ink` file:

- **Time** — `current_time` moves through `evening` → `10:30_pm` → `midnight`,
  and locations open up as it does. The rooftop observatory, the locker room and
  the basement are all gated on the hour.
- **Clues** — `clue_A` through `clue_R`, each one a fact you have established.
  Several conversations only become available once you hold the right clue, and
  characters react differently depending on what you already know.
- **Puzzles** — six of them (`puzzle_note`, `puzzle_math`, `puzzle_trig`,
  `puzzle_circuit`, `puzzle_scarab`, `puzzle_cipher`), tagged in the text with
  `# puzzle:...` so a host application can render an interactive widget in place
  of prose.
- **Trust** — talking to a suspect can go two ways, and `trust_lang`,
  `petra_suspicious`, `osei_deflects` and friends record which way it went.

Tags such as `# clue:B` and `# time_advance:midnight` are emitted alongside the
state changes so a front end can react to them — showing a clue in a journal,
playing a sound, advancing a clock — without parsing the prose.

## Working on it

Edit `obsidian_cat.ink`, then compile it to JSON with [inklecate](https://github.com/inkle/ink/releases)
or the Inky editor:

```bash
inklecate -o obsidian_cat.json obsidian_cat.ink
```

Inky is the easiest way to play through a change as you make it.
