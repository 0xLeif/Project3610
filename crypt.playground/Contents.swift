import UIKit
var min = 5000
var max = 0

var testResults: [Bool] = []

func encode(message: String) -> Bool {
	let message_3610 = strtoul(message, nil, 36)
	let str_message_3610 = "\(message_3610)"
	var chars = str_message_3610.map{ $0 }
	let isEven = chars.count % 2 == 0
	
	if !isEven {
		chars.append("0")
		chars.append("0")
		chars.append("0")
	}
	func fix(values: [Character]) -> [Character] {
		
		return []
	}
	let evenA = stride(from: 0, to: chars.count, by: 2).map { chars[$0] }
	let oddA = stride(from: 1, to: chars.count, by: 2).map { chars[$0] }
	//Only works in equal count
	let fin = zip(evenA, oddA)
	var key = fin.map { "\($0)\($1)" }
					.reduce("", +)
					.replacingOccurrences(of: "000", with: "")
	
	var pairedValues = fin.flatMap { Int("\($0)\($1)") }
	pairedValues.forEach { i in
		if i > max {
			max = i
		}
		if i < min {
			min = i
		}
	}
	
	let encodedLevel1 = pairedValues.map{ String($0, radix: 36) }.reduce("", +)
	let full = String(UInt64(key)!, radix: 36)
	let didPass = full == message
	
	if !didPass {
			print(" - Key: \t\(key)")
			print(" - MaxKey: \(UInt64.max)")
			print(" - PairedValues: \(pairedValues)")
			print(" - encodeLevel1: \(encodedLevel1)")
			print(" - Decoded: \(full) using Key: \(key)")
			print(" - \(full) == \(message)")
			print("\(full == message ? " + " : "\t\t")Test: \(full == message ? "PASSED" : "FAILED")")
	}

	return didPass
}

func test(messages: [String]) {
	testResults.append(contentsOf: messages.map{ encode(message: $0) })
	print("Max: \(max)\nMin: \(min)")
	let results = testResults.filter{ $0 }
	print("TESTS PASSED: \(results.count) / \(testResults.count)")
}
// TEST CASE 1
if false {
	test(messages:  ["hello", "parshav", "zach", "oneleif", "Pneumonoultramicroscopicsilicovolcanoconiosis"])
}
// TEST CASE 2
if false {
	let data = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed pellentesque neque sit amet lacus sagittis placerat. Duis non vehicula mi. Proin molestie odio quis posuere eleifend. Suspendisse interdum scelerisque risus, vel pharetra lectus. Proin vitae feugiat metus, quis varius velit. Suspendisse eget velit augue. Vestibulum scelerisque ante sapien, at pharetra dui feugiat id. Duis euismod et odio a scelerisque. In vitae congue tortor, sed vehicula nunc. Maecenas fringilla lectus id egestas tempus. Maecenas eget imperdiet nunc, quis eleifend lacus. Donec malesuada odio at ante pharetra tincidunt. Donec ultricies eros eu lorem dictum, at aliquam risus dignissim. Nunc in nisl dignissim, egestas tellus vel, porta tortor. Nullam et risus tempor, fermentum tellus id, posuere risus. Curabitur non lectus at erat hendrerit rutrum et non arcu.".lowercased()
	let formattedData = data.replacingOccurrences(of: ".", with: "")
								.replacingOccurrences(of: ",", with: "")
								.replacingOccurrences(of: "\n", with: "")
								.split(separator: " ")
								.map{ String($0) }

	test(messages: formattedData)
}
// TEST CASE 3
if false {
	let message = "3W5E11264GO4C".lowercased()
	let count = message.count
	let formattedData = (0...message.count-2).map{ message.dropLast($0) }
													.map{ String($0) }
	test(messages: formattedData)
}
// TEST CASE 4
if true {
	let data = "Vice President Johnson, Mr. Speaker, Mr. Chief Justice, President Eisenhower, Vice President Nixon, President Truman, Reverend Clergy, fellow citizens: We observe today not a victory of party but a celebration of freedom--symbolizing an end as well as a beginning--signifying renewal as well as change. For I have sworn before you and Almighty God the same solemn oath our forbears prescribed nearly a century and three-quarters ago. The world is very different now. For man holds in his mortal hands the power to abolish all forms of human poverty and all forms of human life. And yet the same revolutionary beliefs for which our forebears fought are still at issue around the globe--the belief that the rights of man come not from the generosity of the state but from the hand of God. We dare not forget today that we are the heirs of that first revolution. Let the word go forth from this time and place, to friend and foe alike, that the torch has been passed to a new generation of Americans--born in this century, tempered by war, disciplined by a hard and bitter peace, proud of our ancient heritage--and unwilling to witness or permit the slow undoing of those human rights to which this nation has always been committed, and to which we are committed today at home and around the world. Let every nation know, whether it wishes us well or ill, that we shall pay any price, bear any burden, meet any hardship, support any friend, oppose any foe to assure the survival and the success of liberty. This much we pledge--and more. To those old allies whose cultural and spiritual origins we share, we pledge the loyalty of faithful friends. United there is little we cannot do in a host of cooperative ventures. Divided there is little we can do--for we dare not meet a powerful challenge at odds and split asunder. To those new states whom we welcome to the ranks of the free, we pledge our word that one form of colonial control shall not have passed away merely to be replaced by a far more iron tyranny. We shall not always expect to find them supporting our view. But we shall always hope to find them strongly supporting their own freedom--and to remember that, in the past, those who foolishly sought power by riding the back of the tiger ended up inside. To those people in the huts and villages of half the globe struggling to break the bonds of mass misery, we pledge our best efforts to help them help themselves, for whatever period is required--not because the communists may be doing it, not because we seek their votes, but because it is right. If a free society cannot help the many who are poor, it cannot save the few who are rich. To our sister republics south of our border, we offer a special pledge--to convert our good words into good deeds--in a new alliance for progress--to assist free men and free governments in casting off the chains of poverty. But this peaceful revolution of hope cannot become the prey of hostile powers. Let all our neighbors know that we shall join with them to oppose aggression or subversion anywhere in the Americas. And let every other power know that this Hemisphere intends to remain the master of its own house. To that world assembly of sovereign states, the United Nations, our last best hope in an age where the instruments of war have far outpaced the instruments of peace, we renew our pledge of support--to prevent it from becoming merely a forum for invective--to strengthen its shield of the new and the weak--and to enlarge the area in which its writ may run. Finally, to those nations who would make themselves our adversary, we offer not a pledge but a request: that both sides begin anew the quest for peace, before the dark powers of destruction unleashed by science engulf all humanity in planned or accidental self-destruction.  We dare not tempt them with weakness. For only when our arms are sufficient beyond doubt can we be certain beyond doubt that they will never be employed.  But neither can two great and powerful groups of nations take comfort from our present course--both sides overburdened by the cost of modern weapons, both rightly alarmed by the steady spread of the deadly atom, yet both racing to alter that uncertain balance of terror that stays the hand of mankind's final war.  So let us begin anew--remembering on both sides that civility is not a sign of weakness, and sincerity is always subject to proof. Let us never negotiate out of fear. But let us never fear to negotiate.  Let both sides explore what problems unite us instead of belaboring those problems which divide us.  Let both sides, for the first time, formulate serious and precise proposals for the inspection and control of arms--and bring the absolute power to destroy other nations under the absolute control of all nations.  Let both sides seek to invoke the wonders of science instead of its terrors. Together let us explore the stars, conquer the deserts, eradicate disease, tap the ocean depths and encourage the arts and commerce.  Let both sides unite to heed in all corners of the earth the command of Isaiah--to \"undo the heavy burdens . . . (and) let the oppressed go free.\"  And if a beachhead of cooperation may push back the jungle of suspicion, let both sides join in creating a new endeavor, not a new balance of power, but a new world of law, where the strong are just and the weak secure and the peace preserved.  All this will not be finished in the first one hundred days. Nor will it be finished in the first one thousand days, nor in the life of this Administration, nor even perhaps in our lifetime on this planet. But let us begin.  In your hands, my fellow citizens, more than mine, will rest the final success or failure of our course. Since this country was founded, each generation of Americans has been summoned to give testimony to its national loyalty. The graves of young Americans who answered the call to service surround the globe.  Now the trumpet summons us again--not as a call to bear arms, though arms we need--not as a call to battle, though embattled we are-- but a call to bear the burden of a long twilight struggle, year in and year out, \"rejoicing in hope, patient in tribulation\"--a struggle against the common enemies of man: tyranny, poverty, disease and war itself.  Can we forge against these enemies a grand and global alliance, North and South, East and West, that can assure a more fruitful life for all mankind? Will you join in that historic effort?  In the long history of the world, only a few generations have been granted the role of defending freedom in its hour of maximum danger. I do not shrink from this responsibility--I welcome it. I do not believe that any of us would exchange places with any other people or any other generation. The energy, the faith, the devotion which we bring to this endeavor will light our country and all who serve it--and the glow from that fire can truly light the world.  And so, my fellow Americans: ask not what your country can do for you--ask what you can do for your country.  My fellow citizens of the world: ask not what America will do for you, but what together we can do for the freedom of man.  Finally, whether you are citizens of America or citizens of the world, ask of us here the same high standards of strength and sacrifice which we ask of you. With a good conscience our only sure reward, with history the final judge of our deeds, let us go forth to lead the land we love, asking His blessing and His help, but knowing that here on earth God's work must truly be our own.".lowercased()
	
	let formattedData = data.replacingOccurrences(of: ".", with: "")
		.replacingOccurrences(of: "'", with: "") // '
		.replacingOccurrences(of: ",", with: "")
		.replacingOccurrences(of: "?", with: "")
		.replacingOccurrences(of: "\n", with: "")
		.replacingOccurrences(of: ";", with: "")
		.replacingOccurrences(of: "--", with: " ")
		.replacingOccurrences(of: "-", with: " ")
		.replacingOccurrences(of: ")", with: "")
		.replacingOccurrences(of: "(", with: "")
		.replacingOccurrences(of: ":", with: "")
		.replacingOccurrences(of: "\"", with: "")
		.split(separator: " ")
		.map{ String($0) }
	
	test(messages: formattedData)
}
