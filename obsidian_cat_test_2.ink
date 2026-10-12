// =============================================
// THE OBSIDIAN CAT
// A Mystery in Five Acts
// =============================================

// ---- State: Time & Progress ----
VAR current_time = "evening"
VAR path_count = 0
VAR time_advanced_to_1030 = false
VAR time_advanced_to_midnight = false
VAR final_hour_warning = false

// --- Track unique locations ---
VAR visited_curator = false
VAR visited_security = false
VAR visited_corridor = false
VAR visited_ballroom = false
VAR visited_observatory = false
VAR visited_lockers = false

// ---- State: Clues ----
VAR clue_A = false      // size-10 muddy boot print, gallery floor
VAR clue_B = false      // shattered case: glass blown OUTWARD (inside job)
VAR clue_B2 = false     // second, smaller boot print — size 6
VAR clue_C = false      // note: "The bird flies at midnight. Roof access. Don't be late. – O"
VAR clue_D = false      // Lang's private correspondence with buyer "Mr. Okafor"
VAR clue_E = false      // blueprint: ventilation shaft from skylight to cold storage
VAR clue_F = false      // security log: Petra Vance (janitor) accessed cold storage at 8:41 PM
VAR clue_G = false      // audio: "...the window of forty seconds is all we need..."
VAR clue_G2 = false     // audio layer 2: a second voice — female, accented — "don't lose the stone"
VAR clue_H = false      // Dr. Renata Osei's star chart with a specific roof angle annotated
VAR clue_I = false      // cold storage: SCARAB symbol + a torn theatre ticket stub
VAR clue_J = false      // trig puzzle solved — rope drop angle confirmed
VAR clue_K = false      // cold storage second visit: chalk outline of the Cat on the floor, measured
VAR clue_L = false      // vault flash drive: Voss on recording coordinating the handover
VAR clue_L2 = false     // second drive in vault: decoy, contains only static
VAR clue_M = false      // Elena's laminated repatriation order — Egyptian Antiquities Authority
VAR clue_N = false      // Marchetti's gambling debts — motive planted as red herring
VAR clue_O = false      // Osei found with the same mud on her boots as the roof
VAR clue_P = false      // Petra Vance's locker — second SCARAB drawn in grease pencil
VAR clue_Q = false      // theatre ticket matches stub found in cold storage
VAR clue_R = false      // Marchetti's alibi confirmed by two waiters — he never left the ballroom

// ---- State: Puzzles ----
VAR puzzle_note = false
VAR puzzle_math = false
VAR puzzle_trig = false
VAR puzzle_circuit = false
VAR puzzle_scarab = false
VAR puzzle_cipher = false

// ---- State: Characters ----
VAR trust_lang = false
VAR pressed_lang = false
VAR talked_marchetti = false
VAR marchetti_rattled = false
VAR talked_petra = false
VAR petra_suspicious = false
VAR talked_osei = false
VAR osei_deflects = false
VAR talked_cole = false
VAR accused_wrong = false
VAR first_talk = true
VAR alibi_green = false

// ---- State: Environment & Events ----
VAR battery_is_low = false
VAR volume_meter_full = false
VAR brightness_boost_done = false
VAR second_cold_room_visit = false
VAR vault_opened = false
VAR examined_bootprint = false


// =============================================
// START
// =============================================
-> prologue


// =============================================
// PROLOGUE
// =============================================
=== prologue ===
    The Grand Metropolitan Museum.
    A gala. Champagne. The low roar of money talking to itself.

    At the centre of the main gallery, sealed inside a two-inch reinforced glass case, sits the Obsidian Cat — a palm-sized Egyptian statue, twenty-sixth dynasty, solid black basalt, its eyes inlaid with beaten gold. Priceless. Literally: the museum refused to insure it because no assessor could agree on a number.

    You are halfway through a mediocre canapé when the lights die.

    Forty-seven seconds of absolute darkness. A crack. A hiss of pressurised glass. Screaming — then the lights stutter back on.

    The case is empty. The Cat is gone.

    By the time Inspector Lyle arrives — coat damp, eyes sharper than his rumpled appearance suggests — the guests have been herded into the east wing. He finds you standing at the plinth.

    "I've seen your work," he says, without preamble. He presses something cold into your palm: a compact UV flashlight, military grade.
    "The board calls the federal authorities at sunrise. You have until then."
    He glances at the empty case.
    "One other thing. The glass didn't shatter inward."
    He lets that hang.
    "It blew outward."

    *   [Switch on the UV flashlight and take a proper look at the scene]
        The beam skims the floor. The resin polish glows pale blue — except for a smear near the plinth where something was dragged. Overlaid on the smear, vivid as a brand: a SCARAB hieroglyph.
        Whoever did this left a calling card. Deliberate. Theatrical. This is a message.
        ~ clue_B = true
        # clue:B
        # tutorial_UV
        -> gallery


// =============================================
// GALLERY
// =============================================
=== gallery ===
    The main gallery after the theft is a study in violence made quiet. Fragments of the case glass crunch underfoot — all of them scattered away from the plinth, confirming what Lyle said. The explosion, if that's the right word, came from inside.

    A muddy boot print — large, size 10, deep-heeled — leads in a single confident stride toward the service door before vanishing on the tile.
    ~ clue_A = true
    # clue:A

    Near the plinth, half-hidden under a toppled flower arrangement, lies a scrap of folded paper.
    -> gallery_menu

=== gallery_menu ===
    *   [Examine the boot print more closely]
        -> gallery_bootprint

    *   [Pick up the torn note]
        -> note_puzzle

    *   { puzzle_note } [Leave. You have seen enough here.]
        -> choose_path

=== gallery_bootprint ===
    Size 10, rubber-soled, deep instep. The mud is dark and gritty, not the composite used on the rooftop installations. Something industrial. You photograph it.
    ~ examined_bootprint = true
    *   [Sweep the floor with the UV flashlight]
        The beam catches something unexpected: three feet to the left of the large print, a second impression, almost erased. Someone lighter. A size 6, narrow toe — ballet flat or a thin-soled shoe. The sort of shoe a member of the museum's housekeeping staff might wear. Not a guest.
        ~ clue_B2 = true
        # clue:B2
        -> gallery_menu
    *   [Leave it for now]
        You have enough to be going on with.
        -> gallery_menu


// =============================================
// NOTE PUZZLE
// =============================================
=== note_puzzle ===
    # puzzle:note
    The note is torn from a larger sheet — expensive cream paper, the kind the museum uses for official correspondence. The ink is blue-black, written with a fine nib. Someone with good handwriting trying to write badly. Three fragments.
    *   (Piece_together_the_fragments) Fit the torn edges together
        ~ puzzle_note = true
        They align perfectly along a diagonal tear, as if someone ripped it in haste.
        The message reads, in full:
        "The bird flies at midnight. Roof access confirmed. Don't be late, and don't be seen. Bring the stone wrap. — O"
        ~ clue_C = true
        # clue:C
        "O." A single initial. The stone wrap — a collector's conservation sleeve. Whoever wrote this knew exactly what they were taking and how to transport it safely.
        -> gallery_menu


// =============================================
// CHOOSE PATH (HUB)
// =============================================
=== choose_path ===
    { path_count >= 2 and not time_advanced_to_1030:
        ~ current_time = "10:30_pm"
        # time_advance:10:30_pm
        ~ time_advanced_to_1030 = true
        The museum has grown quieter. A clock somewhere chimes the half hour. 10:30 PM.
        The remaining guests have been confined to the east wing. The corridors feel longer now, the shadows more deliberate.
    }
    { puzzle_trig and not time_advanced_to_midnight:
        ~ current_time = "midnight"
        # time_advance:midnight
        ~ time_advanced_to_midnight = true
        Somewhere deep in the building, a grandfather clock begins to strike. Twelve slow, resonant notes.
        Midnight. The last guests are asleep or pretending to be. Whatever is going to happen will happen soon.
    }
    { time_advanced_to_midnight and not final_hour_warning:
        ~ final_hour_warning = true
        Lyle materialises at your shoulder. "Two hours until sunrise," he murmurs. "Don't waste them."
    }

    *   [Curator's office — Professor Lang]
        -> curator_office
    *   [Security control room — Marcus Cole]
        -> security_office
    *   [The service corridor — and the cold storage beyond]
        -> service_corridor
    *   [The ballroom — find the suspicious board member]
        -> ballroom
    *   { current_time == "10:30_pm" or current_time == "midnight" } [The rooftop observatory — Dr. Osei]
        -> rooftop_observatory
    *   { (current_time == "10:30_pm" or current_time == "midnight") and talked_cole } [The staff locker room]
        -> locker_room
    *   { clue_I and not clue_Q } [Research the ticket stub]
        -> theatre_ticket
    *   { current_time == "midnight" and (clue_E or clue_J) } [Descend to the basement]
        -> basement_entry
    *   { current_time == "midnight" and (clue_L or (clue_J and path_count >= 3)) } [You have enough. Call everyone to the gallery.]
        -> final_accusation


// =============================================
// CURATOR'S OFFICE — PROFESSOR ALDOUS LANG
// =============================================
=== curator_office ===
    Professor Aldous Lang's office is what happens when a man spends forty years acquiring knowledge and twenty years acquiring things to put it in. Every surface is archaeology: stacked journals, catalogued sherds, framed letters from dead colleagues. He's behind his desk when you enter, and he does not look like a man who has just survived a theft at his institution. He looks like a man who has been waiting for something worse.

    "The security protocols were followed exactly," he says, before you speak. "Exactly." He says it twice. People who are innocent say it once.

    Behind him, a Flemish oil painting of Anubis weighing a heart against a feather hangs slightly crooked on the wall. Behind the painting — not quite hidden enough — the corner of a steel safe protrudes.
    -> curator_office_menu

=== curator_office_menu ===
    *   [Ask Lang where he was during the blackout]
        "In this office. Working. Alone." He folds his hands. They are perfectly still — which takes effort.
        "I came down when I heard the commotion."
        -> curator_office_menu

    *   [Ask about the note — "O"{ clue_D: — and a buyer called Okafor}]
        { clue_D:
            His face doesn't change. It becomes very, very still, which is its own kind of change.
            "I don't know what you're referring to."
            He is lying, and he knows you know it.
            -> curator_office_menu
        - else:
            He blinks. "I'm not familiar with — where did you hear that name?"
            His composure slips, just barely. Then returns.
            -> curator_office_menu
        }

    *   [Press Lang about his finances]
        ~ pressed_lang = true
        He stands abruptly and walks to the window.
        "I have debts. That is not a secret in this building." His voice is lower now, stripped of performance. "Three years ago I authenticated a collection for a Geneva dealer. The pieces were stolen. I didn't know. But the lawsuit took everything."
        He turns. His eyes are red-rimmed.
        "I would never let the Cat leave this building. It is the greatest thing we have. It is the only great thing I have left."
        Something in your chest does the thing it does when someone is telling the truth.
        ~ trust_lang = true
        -> curator_office_menu

    *   [Examine the painting — and what's behind it]
        -> safe_puzzle

    *   { puzzle_math } [You have learned what you can here. Leave.]
        { not visited_curator:
            ~ path_count++
        }
        ~ visited_curator = true
        -> choose_path


// =============================================
// SAFE PUZZLE
// =============================================
=== safe_puzzle ===
    # puzzle:math
    You tilt the Anubis painting aside. The safe is a Mauer combination lock — six digits — and someone has helpfully left a handwritten note tucked behind the painting's lower edge. You unfold it. A sequence of Egyptian hieroglyphic numerals, the kind Lang uses in his published papers. You know enough to read them.
    *   (Test_enter_combination) Translate the hieroglyphs and enter the combination
        ~ puzzle_math = true
        The bolt disengages with a satisfied click.
        Inside: a bundle of letters, rubber-banded, and beneath them a rolled blueprint.
        The letters are between Lang and a man named Kwame Okafor — a private collector in Accra. The most recent letter, dated four days ago, discusses "the transfer of the Black Cat" and a sum in eight figures. Lang's replies are careful, coded. But the intent is unmistakable.
        ~ clue_D = true
        # clue:D
        The blueprint beneath the letters is more alarming: a cross-section of the museum's ventilation system, annotated in a different hand. Someone has traced a route from the rooftop skylight directly down to the cold storage room in the basement. Measurements included. A rope would fit. The angle is marked: approximately thirty degrees from vertical.
        ~ clue_E = true
        # clue:E
        -> curator_office_menu


// =============================================
// SECURITY CONTROL ROOM — MARCUS COLE
// =============================================
=== security_office ===
    Marcus Cole is built like a man who used to be in the military and never really left. He's at the monitor bank when you arrive, rewinding the same forty-seven seconds of footage on loop. The screens show static. Gray. Nothing.

    "Jammed," he says, without looking up. "Professional-grade RF interference. Whoever planned this knew our camera frequency." He pauses the static. "Audio survived. Barely."

    He was wearing size-10 boots. You noticed.
    ~ talked_cole = true
    -> security_office_menu

=== security_office_menu ===
    *   [Ask Cole about his boots]
        He looks down. Back up. "I do a perimeter check every hour. The east garden. The mud is from out there — I went at eight fifteen, before the gala."
        He's calm. Too calm, or calm in the right way? You can't tell yet.
        -> security_office_menu

    *   [Ask Cole about the RF jamming]
        "Military surplus. You can buy the hardware online if you know where to look, but using it on this frequency means knowing our system spec. That's not public."
        He finally looks at you properly.
        "Somebody had the technical manual. Which lives in three places: my office, Lang's office, and the board's security file."
        -> security_office_menu

    *   [Review the security logbook]
        The log is physical — paper, pen, no power needed. Cole keeps it meticulous.
        You scan the 8 PM to 9 PM window. There: an entry in different handwriting from the others. Cramped, hurried.
        "8:41 PM — Petra Vance (maintenance) — cold storage access — routine inspection."
        The gala started at 7 PM. Routine maintenance during a black-tie event. You underline it twice.
        ~ clue_F = true
        # clue:F
        -> security_office_menu

    *   [Ask about the audio — try to isolate the voices]
        -> audio_puzzle

    *   { clue_G } [Leave the control room]
        { not visited_security:
            ~ path_count++
        }
        ~ visited_security = true
        -> choose_path


// =============================================
// AUDIO PUZZLE
// =============================================
=== audio_puzzle ===
    # intercept_volume
    Cole hands you headphones. The recording hisses and pops — the interference gutted the high frequencies. Underneath the static: voices. Compressed, clipped at the edges. You need to amplify and filter.
    *   (Test_amplify_and_filter) Work through the frequency layers
        ~ volume_meter_full = true
        The first voice surfaces. Male. Deliberate. "...the window is forty-seven seconds. Not forty-eight. The generator takes forty-eight to reboot. Do not wait for the light. After fourty-seven exactly, we reset and move below..."
        ~ clue_G = true
        # clue:G
        *   *   [Push further — there may be a second voice underneath]
                The static peels back another layer. Faint. Female.
                "...don't lose the stone. If the stone is lost, everything is lost. Do you understand me?"
                A pause. Then the first voice: "Understood."
                She sounds like someone giving orders to someone who doesn't fully grasp what he's agreed to.
                ~ clue_G2 = true
                # clue:G2
                -> security_office_menu
        *   *   [That is enough. Leave the recording.]
                -> security_office_menu


// =============================================
// BALLROOM — VITTORIO MARCHETTI (Red Herring)
// =============================================
=== ballroom ===
    The ballroom is where the gala guests have been quarantined by Lyle's constables. Eighty people in evening wear, some still holding drinks, all of them performing various versions of shock and indignation. There is a woman near the back, watching everything. Studying everyone.

    One man is performing neither. Vittorio Marchetti — Voss's personal art consultant, according to the guest list — sits alone at a corner table, working through a glass of brandy with the focused application of someone who is not drinking for pleasure.

    He is compact, expensively dressed, with the careful grooming of a man who needs people to take him seriously. His eyes track the room.
    ~ talked_marchetti = true
    -> ballroom_menu

=== ballroom_menu ===
    *   { first_talk } [Sit down across from Marchetti. Say nothing. See what he does.]
        He lets the silence run for six seconds before he speaks. "You're not a police officer." Not a question.
        "No," you agree.
        "Then what do you want?"
        "The same thing everyone in this room wants. The truth."
        He takes a long sip of brandy. "The truth," he says, "is that this museum has been sitting on stolen property for sixty years and everyone is very comfortable pretending otherwise."
        -> ballroom_menu

    *   [Ask Marchetti about Madame Voss]
        ~ first_talk = false
        "I work for Madame Voss. I find things she wants. I negotiate. I do not ask questions about what happens after delivery." He says it with perfect neutrality, as if describing the weather.
        "She wanted the Cat?"
        He looks at you with something close to pity. "Everyone wants the Cat."
        -> ballroom_menu

    *   [Ask Marchetti where he was during the forty-seven seconds]
        ~ first_talk = false
        He nods toward the centre of the room, where a cluster of waiters are still clearing toppled glassware.
        "Ask any of them. I was at the bar ordering a second drink. The barman, the sommelier, and approximately twelve other guests can confirm it. I am not your answer."
        He's right that his alibi is solid — you can see the waiters already nodding in the direction of his table.
        ~ alibi_green = true
        ~ clue_R = true
        # clue:R
        -> ballroom_menu

    *   [Press Marchetti about gambling debts]
        ~ first_talk = false
        ~ marchetti_rattled = true
        His right hand goes still.
        "That is private."
        "So is stealing an Egyptian artefact."
        He leans forward. "I owe money to people who do not wait. Yes. But I did not steal the Cat. If I had stolen it, I would be in a car right now, not sitting here talking to you."
        He's rattled. But he's also correct: a man fleeing doesn't stay in the building.
        ~ clue_N = true
        # clue:N
        -> ballroom_menu

    *   { alibi_green } [Find and confirm Marchetti's alibi with the waiters]
        ~ first_talk = false
        { clue_N:
            Two waiters confirm it independently, without prompting. Marchetti was at the bar from 9:01 to 9:04 PM — the entire duration of the blackout. His debts are real, his motive plausible, but his opportunity is zero. He is a very expensive dead end.
            ~ clue_R = true
            # clue:R
            -> ballroom_menu
        - else:
            You ask around. The barman, the sommelier, a woman in a red dress who was also ordering: all three place Marchetti at the bar during the blackout. He couldn't have done it.
            ~ clue_R = true
            # clue:R
            -> ballroom_menu
        }

    *   [Leave Marchetti and his brandy]
        ~ first_talk = false
        { not visited_ballroom:
            ~ path_count++
        }
        ~ visited_ballroom = true
        -> choose_path


// =============================================
// ROOFTOP OBSERVATORY — DR. RENATA OSEI
// =============================================
=== rooftop_observatory ===
    The rooftop is accessed through a staff staircase behind the conservation lab. The door at the top is supposed to be locked — it is not. The night air hits you cold and sharp.

    The observatory is a glass-and-steel dome, small, built for the museum's astronomy outreach programme. Dr. Renata Osei stands at the central telescope, and she does not flinch when you open the door.

    "I wondered when you'd come up," she says. She is tall, composed, somewhere in her forties, with close-cropped hair and the kind of stillness that comes from long hours alone in dark spaces. She's wearing a field jacket. Her boots are damp. The roof aggregate around the dome is light-coloured sandstone; the dust on her soles matches exactly.
    ~ talked_osei = true
    ~ clue_O = true
    # clue:O
    { examined_bootprint:
        The dark, gritty mud from the gallery print is nothing like this. Whoever wore those size‑10 boots stepped in something industrial. Osei's boots tell a different story.
    }
    -> rooftop_observatory_menu

=== rooftop_observatory_menu ===
    *   [Ask Osei about her wet boots]
        "It rained this evening. I was outside for atmospheric readings before the gala." She gestures to a weather station at the dome's edge. "I do it every Thursday."
        She meets your eyes. She is very good at appearing reasonable.
        ~ osei_deflects = true
        -> rooftop_observatory_menu

    *   [Look at the open notebook on the desk]
        -> trig_puzzle

    *   [Ask Osei about the note — "the bird flies at midnight"]
        { clue_C:
            Something shifts behind her eyes. Just briefly. A recalibration.
            "Where did you find that?"
            "In the gallery."
            She's quiet for a moment. "I think you should speak to Madame Voss."
            "I'm speaking to you."
            She turns back to the telescope. "I want a solicitor."
            { clue_Q:
                "You were at the Lyceum. Row G."
                She shrugs. "As I said, I want a solicitor."
            }
            -> rooftop_observatory_menu
        - else:
            "I don't know what that refers to." Smooth. Immediate.
            -> rooftop_observatory_menu
        }

    *   { puzzle_trig and not puzzle_cipher } [Check the back of Osei's desk]
        -> cipher_puzzle

    *   { puzzle_trig } [Leave the observatory]
        { not visited_observatory:
            ~ path_count++
        }
        ~ visited_observatory = true
        -> choose_path


// =============================================
// TRIG PUZZLE
// =============================================
=== trig_puzzle ===
    # puzzle:trig
    Osei's notebook is open to a page of calculations. At first it reads as legitimate astronomy — declination, azimuth, transit times. But your eye catches something out of place: a structural diagram tucked between star tables. A right triangle. Handwritten. Vertical drop: 9 metres. Horizontal displacement from the skylight to the display plinth below: 14 metres.
    A scrawled question in the margin: "minimum rope angle from vertical for clean clearance?"

    This is not astronomy. This is logistics.
    *   (Test_solve_the_triangle) Work out the angle
        ~ puzzle_trig = true
        Arc-tangent of 14 over 9 gives approximately 57 degrees from vertical — or 33 degrees from horizontal. A shallow, controlled descent. The Cat could be lowered precisely, silently, to within centimetres of the plinth, without needing anyone on the ground floor.

        Someone used this building's own architecture as a delivery mechanism.
        ~ clue_H = true
        # clue:H
        ~ clue_J = true
        # clue:J
        ~ current_time = "midnight"
        ~ time_advanced_to_midnight = true
        # time_advance:midnight
        -> rooftop_observatory_menu


// =============================================
// SERVICE CORRIDOR
// =============================================
=== service_corridor ===
    The service corridor runs the spine of the museum's ground floor — bare concrete, flickering tubes, the smell of industrial cleaner and cold air moving from somewhere below. A catering trolley has been abandoned at an angle, half-blocking the passage. Beyond it, a steel door marked COLD STORAGE stands an inch ajar.

    A junior caterer materialises from behind the trolley, nearly knocking the whole thing over.
    "I didn't touch anything," he announces, which is what guilty people say and what very frightened innocent people say and is therefore not useful information.
    -> service_corridor_menu

=== service_corridor_menu ===
    *   [Ask the caterer what he saw]
        He saw a woman in grey maintenance overalls moving toward the cold storage at around 8:40. "Fast. Like she had somewhere to be. She had something under her arm — flat, rectangular. Like a board or a tray."
        A stone wrap would look like a flat board.
        ~ petra_suspicious = true
        -> service_corridor_menu

    *   [Ask about anyone else in the corridor]
        "There was a tall woman later. Elegant. Not staff — she was in evening wear, but she went through the fire door at the end like she knew where she was going. Maybe eleven o'clock?"
        Eleven o'clock. That would be after the theft. Someone returning to check on something?
        -> service_corridor_menu

    *   [Enter the cold storage room]
        -> cold_room

    *   [Leave the corridor]
        { not visited_corridor:
            ~ path_count++
        }
        ~ visited_corridor = true
        -> choose_path


// =============================================
// COLD STORAGE ROOM
// =============================================
=== cold_room ===
    The cold storage room is where the museum keeps climate-sensitive materials: paper conservancy, textile archives, humidity-controlled drawers of artefact wrapping. The temperature is six degrees Celsius. Your breath fogs.

    At first glance: empty. Orderly. Nothing out of place. You almost turn to leave.
    -> cold_room_menu

=== cold_room_menu ===
    *   [Sweep the room with the UV flashlight]
        The beam hits the far wall and the wall becomes a map.
        A SCARAB hieroglyph — same style as the one in the gallery — glows electric blue. Beneath it, a torn theatre ticket stub, the kind used for coat checks. Blue ink: Row G, Seat 14. The Lyceum, two nights ago.
        ~ clue_I = true
        # clue:I
        { current_time == "midnight" and not second_cold_room_visit:
            ~ second_cold_room_visit = true
            ~ clue_K = true
            # clue:K
            And something else — something that wasn't there before, or that you didn't have the right question to look for.
            On the floor, in chalk that only fluoresces under UV: an outline. Precise. The exact dimensions of the Obsidian Cat, drawn as if someone was practising the placement. Around it, in tiny numerals, measurements. They match the Cat's official conservation record.
            Someone had the Cat's specifications. Someone rehearsed this.
        }
        -> cold_room_menu

    *   [Search the drawers and shelves]
        Conservation materials, catalogue tags, acid-free tissue. And in the third drawer: a thin canvas sleeve, custom-shaped, padded with foam cut to a specific form. The foam impression is unmistakable — the tapered body, the raised ears, the flat base.
        A stone wrap. Made for the Cat specifically. Left behind, which means the Cat was moved by other means, or wrapped in something better.
        -> cold_room_menu

    *   [Leave the cold room] -> service_corridor_menu


// =============================================
// STAFF LOCKER ROOM
// =============================================
=== locker_room ===
    The staff locker room is accessed with a passkey Cole provided. It smells of damp towels and someone's forgotten lunch. Two rows of grey metal lockers, each labelled with a name card.

    You find P. VANCE without difficulty.
    ~ talked_petra = true
    -> locker_room_menu

=== locker_room_menu ===
    *   [Examine Petra Vance's locker (it's unlocked)]
        The locker door swings open easily — someone was in a hurry and didn't pull it shut properly.
        Inside: a grey maintenance jacket, a transit card, a water bottle. Unremarkable. But on the inside of the locker door, scratched into the grey paint with a coin or a key: a SCARAB. Small, neat. The same symbol. You compare it to the one in the cold room. It's identical — down to the slight leftward tilt of the beetle's front leg. Copied, not original. Someone else drew this, to point you here.
        ~ clue_P = true
        # clue:P
        -> locker_room_menu

    *   { talked_cole } [Ask Cole to check the staff board for Vance]
        Cole accesses the staff log. Petra Vance clocked out at 9:03 PM — twelve minutes after the theft. Her clocking-out card is in the rack, but it was used on a reader near the east exit, not the staff exit where she always clocks out. Someone used her card. Or she ran a different way.
        -> locker_room_menu
    *   { not talked_cole } [Check the staff log yourself on the wall terminal]
        Petra Vance clocked out at 9:03 PM — twelve minutes after the theft. The terminal shows the reader used was near the east exit, not the staff exit she usually passes. Someone else may have swiped her card.
        -> locker_room_menu

    *   [Search the rest of the locker room]
        On a bench near the showers: a discarded pair of thin rubber gloves, the disposable kind that leave no prints. Inside one glove, stuck to the latex, two dark grains. You pocket them. Under the UV light: they fluoresce faintly green. The same colour as the basalt dust from the Cat's mounting felt.
        -> locker_room_menu

    *   [Leave the locker room]
        { not visited_lockers:
            ~ path_count++
        }
        ~ visited_lockers = true
        -> choose_path


// =============================================
// BASEMENT ENTRY
// =============================================
=== basement_entry ===
    { clue_E:
        The basement staircase descends below the museum's official floor plan. Lang told you about it, albeit reluctantly, after you found the blueprint in the safe.
    - else:
        The basement staircase appears on no public map. You found it by tracing the old building plans in the security office – a Victorian iron spiral, original to the museum, leading to a part of the building no one talks about.
    }
    The stairs are iron, original Victorian, and they ring with every step.
    The electrical room at the bottom is a cathedral of old fuse boxes and new junction panels, the old museum grafted onto the new one in layers of copper and rubber. The main lights are off. Your flashlight and the UV beam are all you have.
    -> basement_check

=== basement_check ===
    *   (low_battery) Battery running low
        ~ battery_is_low = true
        -> basement_low_battery
    *   (normal_battery) Battery is fine
        ~ battery_is_low = false
        -> circuit_puzzle

=== basement_low_battery ===
    Your phone's battery warning fires. The screen drops to minimum brightness — and in doing so, something remarkable happens. The reduced backlight stops washing out the faint fluorescent markings on the main fuse panel. Three numbers blaze up in UV-reactive ink: 9 — 1 — 4.
    Someone painted these here, knowing this room, knowing UV, knowing that someone would eventually come looking.
    # battery_low_reveal
    -> basement_reveal_numbers


// =============================================
// CIRCUIT PUZZLE
// =============================================
=== circuit_puzzle ===
    # puzzle:circuit
    The fuse panel has been deliberately scrambled — three breakers pulled and reinserted in the wrong configuration, cutting power to a specific display. A message written in the dark, for someone who knows how to read electrical systems.
    You study the wiring diagram mounted on the panel door. Three breakers need to be in the right sequence.
    *   (Test_restore_the_circuit) Restore the correct circuit configuration
        ~ puzzle_circuit = true
        The panel hums. A small illuminated display — the kind used for keypad readouts — flickers on. Three digits in green: 9 — 1 — 4.
        -> basement_reveal_numbers


// =============================================
// BASEMENT REVEAL
// =============================================
=== basement_reveal_numbers ===
    9 — 1 — 4.
    You look at the room. The numbers could be a year — 914, a Byzantine emperor, a distant echo of history. They could be a lock combination. They could be coordinates. But there is, against the east wall, half-hidden behind a rack of archived display materials, a keypad. A heavy, modern keypad on what looks like solid wall — until you put your hand on the panel beside it and feel the seam.
    *   [Enter 9-1-4]
        Three digits. A low, pneumatic groan. The panel swings inward.
        -> hidden_vault


// =============================================
// HIDDEN VAULT
// =============================================
=== hidden_vault ===
    The hidden vault is small — perhaps two metres by three — and it smells of stone and cold air and something else, something older. Climate-controlled, sealed from the main basement. In the centre of the room, on a plinth identical to the one upstairs, sits the Obsidian Cat. Its gold eyes catch your flashlight and throw it back.

    The Cat never left the building. It simply...relocated.
    

    On the wall beside the plinth: the SCARAB again. Larger this time. Confident.
    At the base of the plinth, a small steel compartment is set into the plinth itself, secured with a six-letter electronic keypad. The Cat is inside a case here, too — a glass dome, palm-sized, sealed. Someone put it on display. Down here. For themselves. Separated by a six-letter password.
    You know what it is. You've seen it everywhere. This isn't a guess. 

    ~ vault_opened = true
    -> hidden_vault_menu

=== hidden_vault_menu ===
    *   { not puzzle_scarab } [Enter the password] -> vault_enter_scarab

    // *   [Examine the Cat through the dome]
    //     Under the UV beam, a hairline seam is visible near the Cat's base — a restoration crack, repaired in the 1970s, invisible to the naked eye. But the statue inside this dome has no crack. This Cat is perfect.
    //     Either the museum's records are wrong — or this is not the real Cat.
    //     -> hidden_vault_menu

    *   [Leave the vault]
        { puzzle_scarab:
            You have what you need. It's time to end this.
        - else:
            You are not done here yet.
        }
        -> choose_path

=== vault_enter_scarab ===
    ~ puzzle_scarab = true
    # scarab_entry
    S — C — A — R — A — B.
    The compartment exhales, a breath of pressurised air, and opens.
    Inside: two items. A miniature flash drive and an identical second drive beside it.

    You plug the first drive into your phone. An audio file. Eleven minutes long. You skip to the middle.
    A voice — low, accented, controlled. A woman's voice. The same voice from the security audio, clearer now.
    "Lang will confess if pressured. He knows enough to hurt us, but not enough to destroy us. The Marchetti thread is a gift — let them follow it."
    "A staged theft draws attention outward. While they search the exits, we move it inward."
    "Okafor wil receive it once the noise dies down."
    Then: "And the Elena problem?"
    A pause.
    "Elena will be handled at the airport."
    The voice is Madame Voss. Unmistakable, once you know.
    ~ clue_L = true
    # clue:L

    The second drive — you pull it. Connect it. Static. Seven minutes of static, then silence. A decoy, seeded for exactly this moment.
    ~ clue_L2 = true
    # clue:L2

    { clue_B2 and clue_F:
        *   *   [Use the UV beam on the compartment interior]
                { brightness_boost_done:
                    The light picks out something you nearly missed — in the felt lining, nestled in a slit cut along the seam: a small laminated card, the size of a business card. A photograph of a woman, mid-thirties, calm eyes. Official text in English and Arabic: Egyptian Antiquities Repatriation Authority. Case number. Reference to the Obsidian Cat, by its catalogue name.
                    Whoever Elena is — she is not a thief. She is a civil servant with a mandate.
                    ~ clue_M = true
                    # clue:M
                    -> hidden_vault_menu
                - else:
                    -> vault_brightness_prompt
                }
        *   *   [Leave the compartment alone]
                -> hidden_vault_menu
    - else:
        -> hidden_vault_menu
    }

=== vault_brightness_prompt ===
    # prompt_brightness
    The UV light catches something in the felt — a shape, an edge — but your screen's brightness is drowning it out. You squint. It's just not bright enough.
    *   [Increase the screen brightness and hold the UV beam steady]
        ~ brightness_boost_done = true
        There. Pressed into a slit in the felt lining: a small laminated card. A photograph of a woman — calm, composed — and below it, official text in English and Arabic. Egyptian Antiquities Repatriation Authority. Case reference. The Obsidian Cat, listed by its full dynastic catalogue name.
        Whoever Elena is — she is not a thief. She is a civil servant with a mandate.
        ~ clue_M = true
        # clue:M
        -> hidden_vault_menu
    *   [Leave it. You have enough.]
        -> hidden_vault_menu


// =============================================
// CIPHER INTERLUDE (optional, rooftop)
// =============================================
=== cipher_puzzle ===
    # puzzle:cipher
    On the back of Osei's desk, taped under the lip, is a small card — the kind used to log telescope calibrations. But the numbers don't match any celestial coordinates you recognise. A simple Caesar cipher, shifted by the number of letters in "SCARAB" — six. You work through it.
    *   (Test_decode_cipher) Decode the message
        ~ puzzle_cipher = true
        "The stone is older than all of this. Return it to where it belongs and we are absolved. Keep it and we are thieves. — E"
        E. Not O. A second conspirator with a conscience. Or a double-cross in progress.
        -> rooftop_observatory_menu


// =============================================
// THEATRE TICKET LEAD (optional)
// =============================================
=== theatre_ticket ===
    { clue_I:
        The ticket stub from the cold storage: Row G, Seat 14, The Lyceum, two nights ago.
        You check the Lyceum's box office records online. Row G, Seat 14 was booked under a corporate account — Museum of Grand Metropolitan. But the companion ticket for Seat 13 was booked privately. The name on the booking: R. Osei.
        Dr. Osei was at the theatre two nights before the theft, in an adjacent seat to whoever left that ticket in the cold storage. A coincidence, or a meeting.
        ~ clue_Q = true
        -> choose_path
    - else:
        You don't have the stub yet. There is nothing to check.
        -> choose_path
    }


// =============================================
// FINAL ACCUSATION
// =============================================
=== final_accusation ===
    You ask Inspector Lyle to bring everyone to the main gallery.

    They arrive in varying states of composure. Professor Lang, ash-grey, tugging his cuffs. Madame Voss — silver-haired, immaculate, the kind of woman who owns the room she walks into — standing slightly apart, one hand at her throat. Dr. Osei, controlled but watchful. Vittorio Marchetti, who has given up on the brandy and moved to espresso. Marcus Cole at the door.

    And at the back, near the wall, a woman you don't recognise from the guest list. Slim, thirties, dark coat over a dark shirt, watching you with eyes that are doing several calculations simultaneously.

    Inspector Lyle closes the door behind them.
    "Well?" he says. Quietly. Just to you.

    You have one chance at this.

    *   { clue_A } [Accuse Marcus Cole — the boots match]
        -> ending_marcus

    *   { clue_D } [Accuse Professor Lang — the letters prove motive]
        -> ending_lang

    *   { clue_D and clue_L } [Accuse Madame Voss — you have her on recording]
        -> ending_voss

    *   { clue_J and clue_O } [Accuse Dr. Osei — she planned the geometry of it]
        -> ending_osei

    *   { clue_B2 and clue_F and clue_M } [Say nothing to the room. Step toward the woman at the back.]
        -> secret_elena


// =============================================
// ENDINGS
// =============================================

// ---- ENDING: BAD (Marcus) ----
=== ending_marcus ===
    You point at Cole. "His boots. Size ten. Mud from the rooftop."
    Cole's jaw tightens. "The rooftop mud is sandstone composite. The print in the gallery tested as clay-based. Different soil entirely — it's in the lab report that arrived twenty minutes ago." He pulls out his phone and shows you.
    You were looking at correlation. You missed causation.
    Lyle is already shaking his head. Cole is escorted away — wrongly — for formal questioning. The confusion is exactly what someone needed.
    { clue_D and clue_L:
        Voss straightens her gloves with great satisfaction. Lang stares at the floor.
    - else:
        Voss and Osei exchange the briefest look. The smallest nod.
    }
    By the time the error is corrected, three people have slipped out. The Cat remains in the vault — but Voss's recording is gone. The drives were in Marchetti's pocket, and Marchetti is in a car to Heathrow.
    You got the wrong person and handed the right ones the door.
    The Bad Ending.
    # ending:bad
    # show_ad:interstitial
    -> END


// ---- ENDING: PARTIAL (Lang) ----
=== ending_lang ===
    You lay out the letters. The buyer. The eight-figure sum. Lang doesn't fight it.
    He sits down heavily in one of the gallery chairs, as if his legs have simply stopped working.
    "I arranged the sale," he says. "I did not arrange the theft. I told Okafor the Cat was available. I told him it could be... relocated. Discreetly. I did not know how, or when, or that people would be put at risk." He looks up. "I am complicit. I know that. I am not the architect."
    { trust_lang:
        And you believe him. You believed him in his office when his voice stripped itself bare. He is a man who opened a door without understanding what would walk through it.
    }
    { clue_L:
        Voss watches from across the room with the expression of someone reading a script they wrote.
    }
    Lang is arrested. The Cat is recovered from the vault. But the recording, the flash drive, the woman at the back of the room — all of it goes unaddressed.
    Osei is gone by the time anyone thinks to look for her. Voss gives a brief statement and leaves in a car she organised three hours ago.
    You caught the man who lit the match. The person who planned the fire walks free.
    The Partial Ending.
    # ending:partial
    # show_ad:interstitial
    -> END


// ---- ENDING: STRONG (Voss) ----
=== ending_voss ===
    You plug the flash drive into the gallery's speaker system.
    Voss hears her own voice fill the room — measured, precise, incriminating — and her expression does something remarkable. It doesn't collapse. It hardens. The performance ends and the person behind it finally appears: cold, extraordinarily intelligent, and calculating how many moves remain.
    The answer is none.
    "Lang opened the door," you say.  
    "Osei engineered the method — the descent, the timing, the internal movement."
    
    You look at Voss.
    
    "And you designed the illusion. A theft that never removed the Cat from the building. You moved it down, hid it, and planned to extract it later — quietly — to Okafor."
    
    A pause.
    
    "And Marchetti?" asks Lyle
    
    You glance at Marchetti.
    
    "A planted liability. Debts manufactured to give investigators somewhere obvious to land." 
    Voss is arrested at the gallery exit by two of Lyle's constables. Lang turns witness. Osei — when confronted with the recording and the notebook — cooperates in exchange for a reduced charge.
    The Obsidian Cat is returned to its plinth. A press conference is planned.
    The geometry of the theft is elegant, almost beautiful. It is a shame that it was built for greed.
    The Strong Ending.
    # ending:strong
    # show_ad:interstitial
    -> END


// ---- ENDING: FALSE (Osei) ----
=== ending_osei ===
    You lay out the notebook and the wet boots{clue_Q: , plus the theatre connection}{clue_G2: , and the voice from the recording}.
    Osei listens to all of it without blinking.
    "I planned the extraction, yes," she says, finally. "I designed the rope system. I annotated the blueprint." A pause. "And I was paid very well to do so."
    Lyle is taking notes.
    { clue_L:
        {clue_G:
            "You have a recording of her," Osei says quietly. "But not of me. Because I was always intended to be the one who stayed behind and was caught. This was not a partnership. I was a component."
        - else:
            "You have a recording," Osei says. "But not of me. Because I was always intended to be the one caught. I was a component."
            }
        Something in her face has changed. The calculation has finished. The answer came up wrong.
        Voss and the woman at the back of the room are both gone.
    - else:
        Without the recording, Osei's word against Voss is just noise. Voss's solicitors will make it noise. Osei is detained. Voss offers a brief statement expressing shock and concern, and leaves in a car that was parked outside from 9 PM.
    }
    The Cat is saved. The astronomer who did the maths is arrested. The woman who hired her is on a flight to Zurich.
    You caught the instrument. Not the hand.
    The False Ending.
    # ending:false
    # show_ad:interstitial
    -> END


// ---- ENDING: SECRET ELENA ----
=== secret_elena ===
    You cross the gallery. The woman at the back doesn't move, doesn't run, doesn't perform anything. She simply watches you arrive.

    "The repatriation card," you say, quietly enough that only she hears.
    "You found it," she says. Not a question.
    "And the small boot print. And the cold storage entry at 8:41. Petra Vance didn't make that entry. You borrowed her credentials."
    She nods, once. "My name is Elena Bekele. I work for the Egyptian Antiquities Repatriation Authority. I have for eleven years. The Obsidian Cat was looted in 1962, sold through a Swiss intermediary, and acquired by this museum in 1964. The paperwork was falsified. The museum has known since 2019 and elected to, as the lawyers put it, continue the conversation."
    A very small, very tired smile.
    "I was sent to continue it differently."
    "And the SCARAB symbols across the museum — you left those, to guide us here."
    She nods. 
    "And the cipher on Osei's desk, signed 'E'? That was you as well?"
    Another nod. "Contingencies. If things didn't go as planned."

    *   [Let her go with the Cat] -> elena_let_go
    *   [Stop her. There is a better way.] -> elena_stop


=== elena_let_go ===
    You step back. You hold eye contact. You let a second pass.
    She moves. Quietly, efficiently, in the direction of the service corridor.

    You turn back to the room.
    You present the recording. You name Voss, Osei, Lang. You explain Marchetti's role as a manufactured distraction. Each piece lands exactly where it should.
    The arrests are made.
    In the confusion of the next four hours, no one notices the vault is empty until after Voss has been processed and Lang has begun his statement.
    The Cat is gone. The investigation, officially, goes cold.

    Eight months later, an envelope arrives. No return address. Inside: a photograph of the Obsidian Cat on a stone plinth, flanked by conservators in white gloves, in a museum in Cairo. On the back, in careful handwriting: "Still watching. Thank you."
    You kept faith with something older than the law.
    The Convenient Truth Ending.
    # ending:convenient_truth
    # show_ad:interstitial
    -> END


=== elena_stop ===
    "Wait," you say.
    She stops.
    "Voss told the recording: 'the Elena problem will be handled at the airport.' Do you know what that means?"
    A silence. You watch her understand it.
    "She plans to have me arrested once I land," Elena says slowly. "With the Cat in my possession. Caught in the act. And then the museum gets it back from an embarrassed Egyptian government with full legal cover, and the case for repatriation is poisoned for a decade."
    "Yes."
    She is very quiet. "Then I can't run."
    "No. But you can help me do something better."

    You spend forty minutes with Cole's recording equipment and Elena's own wire, building a case that has no holes. You lay it in front of Lyle piece by piece. He listens with the expression of a man who has been waiting for this exact conversation.

    Voss is intercepted at the museum exit. The flash drive, played in front of three officers and a recording device, is unambiguous. Lang has already begun to talk. Osei, faced with the full architecture of the plan — including her own disposability — cooperates in ninety seconds.

    Elena Bekele is granted diplomatic protection under an emergency Antiquities Authority provision. A solicitor Lyle knows makes two calls.

    Six weeks later, in a ceremony that receives modest but sincere international press coverage, the Obsidian Cat is officially donated by the Grand Metropolitan to the Egyptian Museum in Cairo. Lang — who turns full witness — attends. He cries, which surprises everyone and perhaps himself most of all.

    Inspector Lyle sends you a card. Three words: "You trusted it."
    He means the geometry. He means Elena. He means, perhaps, the version of truth that is not the easiest one but the one that holds.
    The True Ending.
    # ending:geometry_of_truth
    # show_ad:interstitial
    -> END


// =============================================
// END
// =============================================
=== END ===
    -> END