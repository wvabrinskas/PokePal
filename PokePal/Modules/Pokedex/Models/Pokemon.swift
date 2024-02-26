//
//  Pokemon.swift
//  PokePal
//
//  Created by William Vabrinskas on 2/12/24.
//

import Foundation

public enum Pokemon: Int, CaseIterable {
  case bulbasaur = 1
  case ivysaur = 2
  case venusaur = 3
  case charmander = 4
  case charmeleon = 5
  case charizard = 6
  case squirtle = 7
  case wartortle = 8
  case blastoise = 9
  case caterpie = 10
  case metapod = 11
  case butterfree = 12
  case weedle = 13
  case kakuna = 14
  case beedrill = 15
  case pidgey = 16
  case pidgeotto = 17
  case pidgeot = 18
  case rattata = 19
  case raticate = 20
  case spearow = 21
  case fearow = 22
  case ekans = 23
  case arbok = 24
  case pikachu = 25
  case raichu = 26
  case sandshrew = 27
  case sandslash = 28
  case nidoran_f = 29
  case nidorina = 30
  case nidoqueen = 31
  case nidoran_m = 32
  case nidorino = 33
  case nidoking = 34
  case clefairy = 35
  case clefable = 36
  case vulpix = 37
  case ninetales = 38
  case jigglypuff = 39
  case wigglytuff = 40
  case zubat = 41
  case golbat = 42
  case oddish = 43
  case gloom = 44
  case vileplume = 45
  case paras = 46
  case parasect = 47
  case venonat = 48
  case venomoth = 49
  case diglett = 50
  case dugtrio = 51
  case meowth = 52
  case persian = 53
  case psyduck = 54
  case golduck = 55
  case mankey = 56
  case primeape = 57
  case growlithe = 58
  case arcanine = 59
  case poliwag = 60
  case poliwhirl = 61
  case poliwrath = 62
  case abra = 63
  case kadabra = 64
  case alakazam = 65
  case machop = 66
  case machoke = 67
  case machamp = 68
  case bellsprout = 69
  case weepinbell = 70
  case victreebel = 71
  case tentacool = 72
  case tentacruel = 73
  case geodude = 74
  case graveler = 75
  case golem = 76
  case ponyta = 77
  case rapidash = 78
  case slowpoke = 79
  case slowbro = 80
  case magnemite = 81
  case magneton = 82
  case farfetchd = 83
  case doduo = 84
  case dodrio = 85
  case seel = 86
  case dewgong = 87
  case grimer = 88
  case muk = 89
  case shellder = 90
  case cloyster = 91
  case gastly = 92
  case haunter = 93
  case gengar = 94
  case onix = 95
  case drowzee = 96
  case hypno = 97
  case krabby = 98
  case kingler = 99
  case voltorb = 100
  case electrode = 101
  case exeggcute = 102
  case exeggutor = 103
  case cubone = 104
  case marowak = 105
  case hitmonlee = 106
  case hitmonchan = 107
  case lickitung = 108
  case koffing = 109
  case weezing = 110
  case rhyhorn = 111
  case rhydon = 112
  case chansey = 113
  case tangela = 114
  case kangaskhan = 115
  case horsea = 116
  case seadra = 117
  case goldeen = 118
  case seaking = 119
  case staryu = 120
  case starmie = 121
  case mr_mime = 122
  case scyther = 123
  case jynx = 124
  case electabuzz = 125
  case magmar = 126
  case pinsir = 127
  case tauros = 128
  case magikarp = 129
  case gyarados = 130
  case lapras = 131
  case ditto = 132
  case eevee = 133
  case vaporeon = 134
  case jolteon = 135
  case flareon = 136
  case porygon = 137
  case omanyte = 138
  case omastar = 139
  case kabuto = 140
  case kabutops = 141
  case aerodactyl = 142
  case snorlax = 143
  case articuno = 144
  case zapdos = 145
  case moltres = 146
  case dratini = 147
  case dragonair = 148
  case dragonite = 149
  case mewtwo = 150
  case mew = 151
  case chikorita = 152
  case bayleef = 153
  case meganium = 154
  case cyndaquil = 155
  case quilava = 156
  case typhlosion = 157
  case totodile = 158
  case croconaw = 159
  case feraligatr = 160
  case sentret = 161
  case furret = 162
  case hoothoot = 163
  case noctowl = 164
  case ledyba = 165
  case ledian = 166
  case spinarak = 167
  case ariados = 168
  case crobat = 169
  case chinchou = 170
  case lanturn = 171
  case pichu = 172
  case cleffa = 173
  case igglybuff = 174
  case togepi = 175
  case togetic = 176
  case natu = 177
  case xatu = 178
  case mareep = 179
  case flaaffy = 180
  case ampharos = 181
  case bellossom = 182
  case marill = 183
  case azumarill = 184
  case sudowoodo = 185
  case politoed = 186
  case hoppip = 187
  case skiploom = 188
  case jumpluff = 189
  case aipom = 190
  case sunkern = 191
  case sunflora = 192
  case yanma = 193
  case wooper = 194
  case quagsire = 195
  case espeon = 196
  case umbreon = 197
  case murkrow = 198
  case slowking = 199
  case misdreavus = 200
  case unown = 201
  case wobbuffet = 202
  case girafarig = 203
  case pineco = 204
  case forretress = 205
  case dunsparce = 206
  case gligar = 207
  case steelix = 208
  case snubbull = 209
  case granbull = 210
  case qwilfish = 211
  case scizor = 212
  case shuckle = 213
  case heracross = 214
  case sneasel = 215
  case teddiursa = 216
  case ursaring = 217
  case slugma = 218
  case magcargo = 219
  case swinub = 220
  case piloswine = 221
  case corsola = 222
  case remoraid = 223
  case octillery = 224
  case delibird = 225
  case mantine = 226
  case skarmory = 227
  case houndour = 228
  case houndoom = 229
  case kingdra = 230
  case phanpy = 231
  case donphan = 232
  case porygon2 = 233
  case stantler = 234
  case smeargle = 235
  case tyrogue = 236
  case hitmontop = 237
  case smoochum = 238
  case elekid = 239
  case magby = 240
  case miltank = 241
  case blissey = 242
  case raikou = 243
  case entei = 244
  case suicune = 245
  case larvitar = 246
  case pupitar = 247
  case tyranitar = 248
  case lugia = 249
  case ho_oh = 250
  case celebi = 251
  case treecko = 252
  case grovyle = 253
  case sceptile = 254
  case torchic = 255
  case combusken = 256
  case blaziken = 257
  case mudkip = 258
  case marshtomp = 259
  case swampert = 260
  case poochyena = 261
  case mightyena = 262
  case zigzagoon = 263
  case linoone = 264
  case wurmple = 265
  case silcoon = 266
  case beautifly = 267
  case cascoon = 268
  case dustox = 269
  case lotad = 270
  case lombre = 271
  case ludicolo = 272
  case seedot = 273
  case nuzleaf = 274
  case shiftry = 275
  case taillow = 276
  case swellow = 277
  case wingull = 278
  case pelipper = 279
  case ralts = 280
  case kirlia = 281
  case gardevoir = 282
  case surskit = 283
  case masquerain = 284
  case shroomish = 285
  case breloom = 286
  case slakoth = 287
  case vigoroth = 288
  case slaking = 289
  case nincada = 290
  case ninjask = 291
  case shedinja = 292
  case whismur = 293
  case loudred = 294
  case exploud = 295
  case makuhita = 296
  case hariyama = 297
  case azurill = 298
  case nosepass = 299
  case skitty = 300
  case delcatty = 301
  case sableye = 302
  case mawile = 303
  case aron = 304
  case lairon = 305
  case aggron = 306
  case meditite = 307
  case medicham = 308
  case electrike = 309
  case manectric = 310
  case plusle = 311
  case minun = 312
  case volbeat = 313
  case illumise = 314
  case roselia = 315
  case gulpin = 316
  case swalot = 317
  case carvanha = 318
  case sharpedo = 319
  case wailmer = 320
  case wailord = 321
  case numel = 322
  case camerupt = 323
  case torkoal = 324
  case spoink = 325
  case grumpig = 326
  case spinda = 327
  case trapinch = 328
  case vibrava = 329
  case flygon = 330
  case cacnea = 331
  case cacturne = 332
  case swablu = 333
  case altaria = 334
  case zangoose = 335
  case seviper = 336
  case lunatone = 337
  case solrock = 338
  case barboach = 339
  case whiscash = 340
  case corphish = 341
  case crawdaunt = 342
  case baltoy = 343
  case claydol = 344
  case lileep = 345
  case cradily = 346
  case anorith = 347
  case armaldo = 348
  case feebas = 349
  case milotic = 350
  case castform = 351
  case kecleon = 352
  case shuppet = 353
  case banette = 354
  case duskull = 355
  case dusclops = 356
  case tropius = 357
  case chimecho = 358
  case absol = 359
  case wynaut = 360
  case snorunt = 361
  case glalie = 362
  case spheal = 363
  case sealeo = 364
  case walrein = 365
  case clamperl = 366
  case huntail = 367
  case gorebyss = 368
  case relicanth = 369
  case luvdisc = 370
  case bagon = 371
  case shelgon = 372
  case salamence = 373
  case beldum = 374
  case metang = 375
  case metagross = 376
  case regirock = 377
  case regice = 378
  case registeel = 379
  case latias = 380
  case latios = 381
  case kyogre = 382
  case groudon = 383
  case rayquaza = 384
  case jirachi = 385
  case deoxys_normal = 386
  case turtwig = 387
  case grotle = 388
  case torterra = 389
  case chimchar = 390
  case monferno = 391
  case infernape = 392
  case piplup = 393
  case prinplup = 394
  case empoleon = 395
  case starly = 396
  case staravia = 397
  case staraptor = 398
  case bidoof = 399
  case bibarel = 400
  case kricketot = 401
  case kricketune = 402
  case shinx = 403
  case luxio = 404
  case luxray = 405
  case budew = 406
  case roserade = 407
  case cranidos = 408
  case rampardos = 409
  case shieldon = 410
  case bastiodon = 411
  case burmy = 412
  case wormadam_plant = 413
  case mothim = 414
  case combee = 415
  case vespiquen = 416
  case pachirisu = 417
  case buizel = 418
  case floatzel = 419
  case cherubi = 420
  case cherrim = 421
  case shellos = 422
  case gastrodon = 423
  case ambipom = 424
  case drifloon = 425
  case drifblim = 426
  case buneary = 427
  case lopunny = 428
  case mismagius = 429
  case honchkrow = 430
  case glameow = 431
  case purugly = 432
  case chingling = 433
  case stunky = 434
  case skuntank = 435
  case bronzor = 436
  case bronzong = 437
  case bonsly = 438
  case mime_jr = 439
  case happiny = 440
  case chatot = 441
  case spiritomb = 442
  case gible = 443
  case gabite = 444
  case garchomp = 445
  case munchlax = 446
  case riolu = 447
  case lucario = 448
  case hippopotas = 449
  case hippowdon = 450
  case skorupi = 451
  case drapion = 452
  case croagunk = 453
  case toxicroak = 454
  case carnivine = 455
  case finneon = 456
  case lumineon = 457
  case mantyke = 458
  case snover = 459
  case abomasnow = 460
  case weavile = 461
  case magnezone = 462
  case lickilicky = 463
  case rhyperior = 464
  case tangrowth = 465
  case electivire = 466
  case magmortar = 467
  case togekiss = 468
  case yanmega = 469
  case leafeon = 470
  case glaceon = 471
  case gliscor = 472
  case mamoswine = 473
  case porygon_z = 474
  case gallade = 475
  case probopass = 476
  case dusknoir = 477
  case froslass = 478
  case rotom = 479
  case uxie = 480
  case mesprit = 481
  case azelf = 482
  case dialga = 483
  case palkia = 484
  case heatran = 485
  case regigigas = 486
  case giratina_altered = 487
  case cresselia = 488
  case phione = 489
  case manaphy = 490
  case darkrai = 491
  case shaymin_land = 492
  case arceus = 493
  case victini = 494
  case snivy = 495
  case servine = 496
  case serperior = 497
  case tepig = 498
  case pignite = 499
  case emboar = 500
  case oshawott = 501
  case dewott = 502
  case samurott = 503
  case patrat = 504
  case watchog = 505
  case lillipup = 506
  case herdier = 507
  case stoutland = 508
  case purrloin = 509
  case liepard = 510
  case pansage = 511
  case simisage = 512
  case pansear = 513
  case simisear = 514
  case panpour = 515
  case simipour = 516
  case munna = 517
  case musharna = 518
  case pidove = 519
  case tranquill = 520
  case unfezant = 521
  case blitzle = 522
  case zebstrika = 523
  case roggenrola = 524
  case boldore = 525
  case gigalith = 526
  case woobat = 527
  case swoobat = 528
  case drilbur = 529
  case excadrill = 530
  case audino = 531
  case timburr = 532
  case gurdurr = 533
  case conkeldurr = 534
  case tympole = 535
  case palpitoad = 536
  case seismitoad = 537
  case throh = 538
  case sawk = 539
  case sewaddle = 540
  case swadloon = 541
  case leavanny = 542
  case venipede = 543
  case whirlipede = 544
  case scolipede = 545
  case cottonee = 546
  case whimsicott = 547
  case petilil = 548
  case lilligant = 549
  case basculin_red_striped = 550
  case sandile = 551
  case krokorok = 552
  case krookodile = 553
  case darumaka = 554
  case darmanitan_standard = 555
  case maractus = 556
  case dwebble = 557
  case crustle = 558
  case scraggy = 559
  case scrafty = 560
  case sigilyph = 561
  case yamask = 562
  case cofagrigus = 563
  case tirtouga = 564
  case carracosta = 565
  case archen = 566
  case archeops = 567
  case trubbish = 568
  case garbodor = 569
  case zorua = 570
  case zoroark = 571
  case minccino = 572
  case cinccino = 573
  case gothita = 574
  case gothorita = 575
  case gothitelle = 576
  case solosis = 577
  case duosion = 578
  case reuniclus = 579
  case ducklett = 580
  case swanna = 581
  case vanillite = 582
  case vanillish = 583
  case vanilluxe = 584
  case deerling = 585
  case sawsbuck = 586
  case emolga = 587
  case karrablast = 588
  case escavalier = 589
  case foongus = 590
  case amoonguss = 591
  case frillish = 592
  case jellicent = 593
  case alomomola = 594
  case joltik = 595
  case galvantula = 596
  case ferroseed = 597
  case ferrothorn = 598
  case klink = 599
  case klang = 600
  case klinklang = 601
  case tynamo = 602
  case eelektrik = 603
  case eelektross = 604
  case elgyem = 605
  case beheeyem = 606
  case litwick = 607
  case lampent = 608
  case chandelure = 609
  case axew = 610
  case fraxure = 611
  case haxorus = 612
  case cubchoo = 613
  case beartic = 614
  case cryogonal = 615
  case shelmet = 616
  case accelgor = 617
  case stunfisk = 618
  case mienfoo = 619
  case mienshao = 620
  case druddigon = 621
  case golett = 622
  case golurk = 623
  case pawniard = 624
  case bisharp = 625
  case bouffalant = 626
  case rufflet = 627
  case braviary = 628
  case vullaby = 629
  case mandibuzz = 630
  case heatmor = 631
  case durant = 632
  case deino = 633
  case zweilous = 634
  case hydreigon = 635
  case larvesta = 636
  case volcarona = 637
  case cobalion = 638
  case terrakion = 639
  case virizion = 640
  case tornadus_incarnate = 641
  case thundurus_incarnate = 642
  case reshiram = 643
  case zekrom = 644
  case landorus_incarnate = 645
  case kyurem = 646
  case keldeo_ordinary = 647
  case meloetta_aria = 648
  case genesect = 649
  case chespin = 650
  case quilladin = 651
  case chesnaught = 652
  case fennekin = 653
  case braixen = 654
  case delphox = 655
  case froakie = 656
  case frogadier = 657
  case greninja = 658
  case bunnelby = 659
  case diggersby = 660
  case fletchling = 661
  case fletchinder = 662
  case talonflame = 663
  case scatterbug = 664
  case spewpa = 665
  case vivillon = 666
  case litleo = 667
  case pyroar = 668
  case flabebe = 669
  case floette = 670
  case florges = 671
  case skiddo = 672
  case gogoat = 673
  case pancham = 674
  case pangoro = 675
  case furfrou = 676
  case espurr = 677
  case meowstic_male = 678
  case honedge = 679
  case doublade = 680
  case aegislash_shield = 681
  case spritzee = 682
  case aromatisse = 683
  case swirlix = 684
  case slurpuff = 685
  case inkay = 686
  case malamar = 687
  case binacle = 688
  case barbaracle = 689
  case skrelp = 690
  case dragalge = 691
  case clauncher = 692
  case clawitzer = 693
  case helioptile = 694
  case heliolisk = 695
  case tyrunt = 696
  case tyrantrum = 697
  case amaura = 698
  case aurorus = 699
  case sylveon = 700
  case hawlucha = 701
  case dedenne = 702
  case carbink = 703
  case goomy = 704
  case sliggoo = 705
  case goodra = 706
  case klefki = 707
  case phantump = 708
  case trevenant = 709
  case pumpkaboo_average = 710
  case gourgeist_average = 711
  case bergmite = 712
  case avalugg = 713
  case noibat = 714
  case noivern = 715
  case xerneas = 716
  case yveltal = 717
  case zygarde_50 = 718
  case diancie = 719
  case hoopa = 720
  case volcanion = 721
  case rowlet = 722
  case dartrix = 723
  case decidueye = 724
  case litten = 725
  case torracat = 726
  case incineroar = 727
  case popplio = 728
  case brionne = 729
  case primarina = 730
  case pikipek = 731
  case trumbeak = 732
  case toucannon = 733
  case yungoos = 734
  case gumshoos = 735
  case grubbin = 736
  case charjabug = 737
  case vikavolt = 738
  case crabrawler = 739
  case crabominable = 740
  case oricorio_baile = 741
  case cutiefly = 742
  case ribombee = 743
  case rockruff = 744
  case lycanroc_midday = 745
  case wishiwashi_solo = 746
  case mareanie = 747
  case toxapex = 748
  case mudbray = 749
  case mudsdale = 750
  case dewpider = 751
  case araquanid = 752
  case fomantis = 753
  case lurantis = 754
  case morelull = 755
  case shiinotic = 756
  case salandit = 757
  case salazzle = 758
  case stufful = 759
  case bewear = 760
  case bounsweet = 761
  case steenee = 762
  case tsareena = 763
  case comfey = 764
  case oranguru = 765
  case passimian = 766
  case wimpod = 767
  case golisopod = 768
  case sandygast = 769
  case palossand = 770
  case pyukumuku = 771
  case type_null = 772
  case silvally = 773
  case minior_red_meteor = 774
  case komala = 775
  case turtonator = 776
  case togedemaru = 777
  case mimikyu_disguised = 778
  case bruxish = 779
  case drampa = 780
  case dhelmise = 781
  case jangmo_o = 782
  case hakamo_o = 783
  case kommo_o = 784
  case tapu_koko = 785
  case tapu_lele = 786
  case tapu_bulu = 787
  case tapu_fini = 788
  case cosmog = 789
  case cosmoem = 790
  case solgaleo = 791
  case lunala = 792
  case nihilego = 793
  case buzzwole = 794
  case pheromosa = 795
  case xurkitree = 796
  case celesteela = 797
  case kartana = 798
  case guzzlord = 799
  case necrozma = 800
  case magearna = 801
  case marshadow = 802
  case poipole = 803
  case naganadel = 804
  case stakataka = 805
  case blacephalon = 806
  case zeraora = 807
  case meltan = 808
  case melmetal = 809
  case grookey = 810
  case thwackey = 811
  case rillaboom = 812
  case scorbunny = 813
  case raboot = 814
  case cinderace = 815
  case sobble = 816
  case drizzile = 817
  case inteleon = 818
  case skwovet = 819
  case greedent = 820
  case rookidee = 821
  case corvisquire = 822
  case corviknight = 823
  case blipbug = 824
  case dottler = 825
  case orbeetle = 826
  case nickit = 827
  case thievul = 828
  case gossifleur = 829
  case eldegoss = 830
  case wooloo = 831
  case dubwool = 832
  case chewtle = 833
  case drednaw = 834
  case yamper = 835
  case boltund = 836
  case rolycoly = 837
  case carkol = 838
  case coalossal = 839
  case applin = 840
  case flapple = 841
  case appletun = 842
  case silicobra = 843
  case sandaconda = 844
  case cramorant = 845
  case arrokuda = 846
  case barraskewda = 847
  case toxel = 848
  case toxtricity_amped = 849
  case sizzlipede = 850
  case centiskorch = 851
  case clobbopus = 852
  case grapploct = 853
  case sinistea = 854
  case polteageist = 855
  case hatenna = 856
  case hattrem = 857
  case hatterene = 858
  case impidimp = 859
  case morgrem = 860
  case grimmsnarl = 861
  case obstagoon = 862
  case perrserker = 863
  case cursola = 864
  case sirfetchd = 865
  case mr_rime = 866
  case runerigus = 867
  case milcery = 868
  case alcremie = 869
  case falinks = 870
  case pincurchin = 871
  case snom = 872
  case frosmoth = 873
  case stonjourner = 874
  case eiscue_ice = 875
  case indeedee_male = 876
  case morpeko_full_belly = 877
  case cufant = 878
  case copperajah = 879
  case dracozolt = 880
  case arctozolt = 881
  case dracovish = 882
  case arctovish = 883
  case duraludon = 884
  case dreepy = 885
  case drakloak = 886
  case dragapult = 887
  case zacian = 888
  case zamazenta = 889
  case eternatus = 890
  case kubfu = 891
  case urshifu_single_strike = 892
  case zarude = 893
  case regieleki = 894
  case regidrago = 895
  case glastrier = 896
  case spectrier = 897
  case calyrex = 898
  case wyrdeer = 899
  case kleavor = 900
  case ursaluna = 901
  case basculegion_male = 902
  case sneasler = 903
  case overqwil = 904
  case enamorus_incarnate = 905
  case sprigatito = 906
  case floragato = 907
  case meowscarada = 908
  case fuecoco = 909
  case crocalor = 910
  case skeledirge = 911
  case quaxly = 912
  case quaxwell = 913
  case quaquaval = 914
  case lechonk = 915
  case oinkologne = 916
  case tarountula = 917
  case spidops = 918
  case nymble = 919
  case lokix = 920
  case pawmi = 921
  case pawmo = 922
  case pawmot = 923
  case tandemaus = 924
  case maushold = 925
  case fidough = 926
  case dachsbun = 927
  case smoliv = 928
  case dolliv = 929
  case arboliva = 930
  case squawkabilly = 931
  case nacli = 932
  case naclstack = 933
  case garganacl = 934
  case charcadet = 935
  case armarouge = 936
  case ceruledge = 937
  case tadbulb = 938
  case bellibolt = 939
  case wattrel = 940
  case kilowattrel = 941
  case maschiff = 942
  case mabosstiff = 943
  case shroodle = 944
  case grafaiai = 945
  case bramblin = 946
  case brambleghast = 947
  case toedscool = 948
  case toedscruel = 949
  case klawf = 950
  case capsakid = 951
  case scovillain = 952
  case rellor = 953
  case rabsca = 954
  case flittle = 955
  case espathra = 956
  case tinkatink = 957
  case tinkatuff = 958
  case tinkaton = 959
  case wiglett = 960
  case wugtrio = 961
  case bombirdier = 962
  case finizen = 963
  case palafin = 964
  case varoom = 965
  case revavroom = 966
  case cyclizar = 967
  case orthworm = 968
  case glimmet = 969
  case glimmora = 970
  case greavard = 971
  case houndstone = 972
  case flamigo = 973
  case cetoddle = 974
  case cetitan = 975
  case veluza = 976
  case dondozo = 977
  case tatsugiri = 978
  case annihilape = 979
  case clodsire = 980
  case farigiraf = 981
  case dudunsparce = 982
  case kingambit = 983
  case great_tusk = 984
  case scream_tail = 985
  case brute_bonnet = 986
  case flutter_mane = 987
  case slither_wing = 988
  case sandy_shocks = 989
  case iron_treads = 990
  case iron_bundle = 991
  case iron_hands = 992
  case iron_jugulis = 993
  case iron_moth = 994
  case iron_thorns = 995
  case frigibax = 996
  case arctibax = 997
  case baxcalibur = 998
  case gimmighoul = 999
  case gholdengo = 1000
  case wo_chien = 1001
  case chien_pao = 1002
  case ting_lu = 1003
  case chi_yu = 1004
  case roaring_moon = 1005
  case iron_valiant = 1006
  case koraidon = 1007
  case miraidon = 1008
  case walking_wake = 1009
  case iron_leaves = 1010
  case dipplin = 1011
  case poltchageist = 1012
  case sinistcha = 1013
  case okidogi = 1014
  case munkidori = 1015
  case fezandipiti = 1016
  case ogerpon = 1017
  case archaludon = 1018
  case hydrapple = 1019
  case gouging_fire = 1020
  case raging_bolt = 1021
  case iron_boulder = 1022
  case iron_crown = 1023
  case terapagos = 1024
  case pecharunt = 1025
  case deoxys_attack = 1026
  case deoxys_defense = 1027
  case deoxys_speed = 1028
  case wormadam_sandy = 1029
  case wormadam_trash = 1030
  case shaymin_sky = 1031
  case giratina_origin = 1032
  case rotom_heat = 1033
  case rotom_wash = 1034
  case rotom_frost = 1035
  case rotom_fan = 1036
  case rotom_mow = 1037
  case castform_sunny = 1038
  case castform_rainy = 1039
  case castform_snowy = 1040
  case basculin_blue_striped = 1041
  case darmanitan_zen = 1042
  case meloetta_pirouette = 1043
  case tornadus_therian = 1044
  case thundurus_therian = 1045
  case landorus_therian = 1046
  case kyurem_black = 1047
  case kyurem_white = 1048
  case keldeo_resolute = 1049
  case meowstic_female = 1050
  case aegislash_blade = 1051
  case pumpkaboo_small = 1052
  case pumpkaboo_large = 1053
  case pumpkaboo_super = 1054
  case gourgeist_small = 1055
  case gourgeist_large = 1056
  case gourgeist_super = 1057
  case venusaur_mega = 1058
  case charizard_mega_x = 1059
  case charizard_mega_y = 1060
  case blastoise_mega = 1061
  case alakazam_mega = 1062
  case gengar_mega = 1063
  case kangaskhan_mega = 1064
  case pinsir_mega = 1065
  case gyarados_mega = 1066
  case aerodactyl_mega = 1067
  case mewtwo_mega_x = 1068
  case mewtwo_mega_y = 1069
  case ampharos_mega = 1070
  case scizor_mega = 1071
  case heracross_mega = 1072
  case houndoom_mega = 1073
  case tyranitar_mega = 1074
  case blaziken_mega = 1075
  case gardevoir_mega = 1076
  case mawile_mega = 1077
  case aggron_mega = 1078
  case medicham_mega = 1079
  case manectric_mega = 1080
  case banette_mega = 1081
  case absol_mega = 1082
  case garchomp_mega = 1083
  case lucario_mega = 1084
  case abomasnow_mega = 1085
  case floette_eternal = 1086
  case latias_mega = 1087
  case latios_mega = 1088
  case swampert_mega = 1089
  case sceptile_mega = 1090
  case sableye_mega = 1091
  case altaria_mega = 1092
  case gallade_mega = 1093
  case audino_mega = 1094
  case sharpedo_mega = 1095
  case slowbro_mega = 1096
  case steelix_mega = 1097
  case pidgeot_mega = 1098
  case glalie_mega = 1099
  case diancie_mega = 1100
  case metagross_mega = 1101
  case kyogre_primal = 1102
  case groudon_primal = 1103
  case rayquaza_mega = 1104
  case pikachu_rock_star = 1105
  case pikachu_belle = 1106
  case pikachu_pop_star = 1107
  case pikachu_phd = 1108
  case pikachu_libre = 1109
  case pikachu_cosplay = 1110
  case hoopa_unbound = 1111
  case camerupt_mega = 1112
  case lopunny_mega = 1113
  case salamence_mega = 1114
  case beedrill_mega = 1115
  case rattata_alola = 1116
  case raticate_alola = 1117
  case raticate_totem_alola = 1118
  case pikachu_original_cap = 1119
  case pikachu_hoenn_cap = 1120
  case pikachu_sinnoh_cap = 1121
  case pikachu_unova_cap = 1122
  case pikachu_kalos_cap = 1123
  case pikachu_alola_cap = 1124
  case raichu_alola = 1125
  case sandshrew_alola = 1126
  case sandslash_alola = 1127
  case vulpix_alola = 1128
  case ninetales_alola = 1129
  case diglett_alola = 1130
  case dugtrio_alola = 1131
  case meowth_alola = 1132
  case persian_alola = 1133
  case geodude_alola = 1134
  case graveler_alola = 1135
  case golem_alola = 1136
  case grimer_alola = 1137
  case muk_alola = 1138
  case exeggutor_alola = 1139
  case marowak_alola = 1140
  case greninja_battle_bond = 1141
  case greninja_ash = 1142
  case zygarde_10_power_construct = 1143
  case zygarde_50_power_construct = 1144
  case zygarde_complete = 1145
  case gumshoos_totem = 1146
  case vikavolt_totem = 1147
  case oricorio_pom_pom = 1148
  case oricorio_pau = 1149
  case oricorio_sensu = 1150
  case lycanroc_midnight = 1151
  case wishiwashi_school = 1152
  case lurantis_totem = 1153
  case salazzle_totem = 1154
  case minior_orange_meteor = 1155
  case minior_yellow_meteor = 1156
  case minior_green_meteor = 1157
  case minior_blue_meteor = 1158
  case minior_indigo_meteor = 1159
  case minior_violet_meteor = 1160
  case minior_red = 1161
  case minior_orange = 1162
  case minior_yellow = 1163
  case minior_green = 1164
  case minior_blue = 1165
  case minior_indigo = 1166
  case minior_violet = 1167
  case mimikyu_busted = 1168
  case mimikyu_totem_disguised = 1169
  case mimikyu_totem_busted = 1170
  case kommo_o_totem = 1171
  case magearna_original = 1172
  case pikachu_partner_cap = 1173
  case marowak_totem = 1174
  case ribombee_totem = 1175
  case rockruff_own_tempo = 1176
  case lycanroc_dusk = 1177
  case araquanid_totem = 1178
  case togedemaru_totem = 1179
  case necrozma_dusk = 1180
  case necrozma_dawn = 1181
  case necrozma_ultra = 1182
  case pikachu_starter = 1183
  case eevee_starter = 1184
  case pikachu_world_cap = 1185
  case meowth_galar = 1186
  case ponyta_galar = 1187
  case rapidash_galar = 1188
  case slowpoke_galar = 1189
  case slowbro_galar = 1190
  case farfetchd_galar = 1191
  case weezing_galar = 1192
  case mr_mime_galar = 1193
  case articuno_galar = 1194
  case zapdos_galar = 1195
  case moltres_galar = 1196
  case slowking_galar = 1197
  case corsola_galar = 1198
  case zigzagoon_galar = 1199
  case linoone_galar = 1200
  case darumaka_galar = 1201
  case darmanitan_galar_standard = 1202
  case darmanitan_galar_zen = 1203
  case yamask_galar = 1204
  case stunfisk_galar = 1205
  case zygarde_10 = 1206
  case cramorant_gulping = 1207
  case cramorant_gorging = 1208
  case toxtricity_low_key = 1209
  case morpeko_hangry = 1210
  case zacian_crowned = 1211
  case zamazenta_crowned = 1212
  case eternatus_eternamax = 1213
  case urshifu_rapid_strike = 1214
  case zarude_dada = 1215
  case calyrex_ice = 1216
  case calyrex_shadow = 1217
  case venusaur_gmax = 1218
  case charizard_gmax = 1219
  case blastoise_gmax = 1220
  case butterfree_gmax = 1221
  case pikachu_gmax = 1222
  case meowth_gmax = 1223
  case machamp_gmax = 1224
  case gengar_gmax = 1225
  case kingler_gmax = 1226
  case lapras_gmax = 1227
  case eevee_gmax = 1228
  case snorlax_gmax = 1229
  case garbodor_gmax = 1230
  case melmetal_gmax = 1231
  case rillaboom_gmax = 1232
  case cinderace_gmax = 1233
  case inteleon_gmax = 1234
  case corviknight_gmax = 1235
  case orbeetle_gmax = 1236
  case drednaw_gmax = 1237
  case coalossal_gmax = 1238
  case flapple_gmax = 1239
  case appletun_gmax = 1240
  case sandaconda_gmax = 1241
  case toxtricity_amped_gmax = 1242
  case centiskorch_gmax = 1243
  case hatterene_gmax = 1244
  case grimmsnarl_gmax = 1245
  case alcremie_gmax = 1246
  case copperajah_gmax = 1247
  case duraludon_gmax = 1248
  case urshifu_single_strike_gmax = 1249
  case toxtricity_low_key_gmax = 1250
  case growlithe_hisui = 1251
  case arcanine_hisui = 1252
  case voltorb_hisui = 1253
  case electrode_hisui = 1254
  case typhlosion_hisui = 1255
  case qwilfish_hisui = 1256
  case sneasel_hisui = 1257
  case samurott_hisui = 1258
  case lilligant_hisui = 1259
  case zorua_hisui = 1260
  case zoroark_hisui = 1261
  case braviary_hisui = 1262
  case sliggoo_hisui = 1263
  case goodra_hisui = 1264
  case avalugg_hisui = 1265
  case decidueye_hisui = 1266
  case dialga_origin = 1267
  case palkia_origin = 1268
  case basculin_white_striped = 1269
  case basculegion_female = 1270
  case enamorus_therian = 1271
  case tauros_paldea_combat_breed = 1272
  case tauros_paldea_blaze_breed = 1273
  case tauros_paldea_aqua_breed = 1274
  case wooper_paldea = 1275
  case oinkologne_female = 1276
  case dudunsparce_three_segment = 1277
  case palafin_hero = 1278
  case maushold_family_of_three = 1279
  case tatsugiri_droopy = 1280
  case tatsugiri_stretchy = 1281
  case squawkabilly_blue_plumage = 1282
  case squawkabilly_yellow_plumage = 1283
  case squawkabilly_white_plumage = 1284
  case gimmighoul_roaming = 1285
  case ursaluna_bloodmoon = 1294
  case ogerpon_wellspring_mask = 1295
  case ogerpon_hearthflame_mask = 1296
  case ogerpon_cornerstone_mask = 1297
  case terapagos_terastal = 1298
  case unknown
  
  static func from(_ rawValue: Int) -> Pokemon {
    guard let from = Pokemon.init(rawValue: rawValue) else {
      return .unknown
    }
    
    return from
  }
  
  func url() -> URL? {
    let baseUrl = "https://www.serebii.net/pokemon/"
    let name = name().split(separator: " ")[0].lowercased()
    return URL(string: baseUrl + name)
  }
  
  func name() -> String {
    switch self {
    case .unknown: return ""
    case .bulbasaur: return "Bulbasaur"
    case .ivysaur: return "Ivysaur"
    case .venusaur: return "Venusaur"
    case .charmander: return "Charmander"
    case .charmeleon: return "Charmeleon"
    case .charizard: return "Charizard"
    case .squirtle: return "Squirtle"
    case .wartortle: return "Wartortle"
    case .blastoise: return "Blastoise"
    case .caterpie: return "Caterpie"
    case .metapod: return "Metapod"
    case .butterfree: return "Butterfree"
    case .weedle: return "Weedle"
    case .kakuna: return "Kakuna"
    case .beedrill: return "Beedrill"
    case .pidgey: return "Pidgey"
    case .pidgeotto: return "Pidgeotto"
    case .pidgeot: return "Pidgeot"
    case .rattata: return "Rattata"
    case .raticate: return "Raticate"
    case .spearow: return "Spearow"
    case .fearow: return "Fearow"
    case .ekans: return "Ekans"
    case .arbok: return "Arbok"
    case .pikachu: return "Pikachu"
    case .raichu: return "Raichu"
    case .sandshrew: return "Sandshrew"
    case .sandslash: return "Sandslash"
    case .nidoran_f: return "Nidoran F"
    case .nidorina: return "Nidorina"
    case .nidoqueen: return "Nidoqueen"
    case .nidoran_m: return "Nidoran M"
    case .nidorino: return "Nidorino"
    case .nidoking: return "Nidoking"
    case .clefairy: return "Clefairy"
    case .clefable: return "Clefable"
    case .vulpix: return "Vulpix"
    case .ninetales: return "Ninetales"
    case .jigglypuff: return "Jigglypuff"
    case .wigglytuff: return "Wigglytuff"
    case .zubat: return "Zubat"
    case .golbat: return "Golbat"
    case .oddish: return "Oddish"
    case .gloom: return "Gloom"
    case .vileplume: return "Vileplume"
    case .paras: return "Paras"
    case .parasect: return "Parasect"
    case .venonat: return "Venonat"
    case .venomoth: return "Venomoth"
    case .diglett: return "Diglett"
    case .dugtrio: return "Dugtrio"
    case .meowth: return "Meowth"
    case .persian: return "Persian"
    case .psyduck: return "Psyduck"
    case .golduck: return "Golduck"
    case .mankey: return "Mankey"
    case .primeape: return "Primeape"
    case .growlithe: return "Growlithe"
    case .arcanine: return "Arcanine"
    case .poliwag: return "Poliwag"
    case .poliwhirl: return "Poliwhirl"
    case .poliwrath: return "Poliwrath"
    case .abra: return "Abra"
    case .kadabra: return "Kadabra"
    case .alakazam: return "Alakazam"
    case .machop: return "Machop"
    case .machoke: return "Machoke"
    case .machamp: return "Machamp"
    case .bellsprout: return "Bellsprout"
    case .weepinbell: return "Weepinbell"
    case .victreebel: return "Victreebel"
    case .tentacool: return "Tentacool"
    case .tentacruel: return "Tentacruel"
    case .geodude: return "Geodude"
    case .graveler: return "Graveler"
    case .golem: return "Golem"
    case .ponyta: return "Ponyta"
    case .rapidash: return "Rapidash"
    case .slowpoke: return "Slowpoke"
    case .slowbro: return "Slowbro"
    case .magnemite: return "Magnemite"
    case .magneton: return "Magneton"
    case .farfetchd: return "Farfetchd"
    case .doduo: return "Doduo"
    case .dodrio: return "Dodrio"
    case .seel: return "Seel"
    case .dewgong: return "Dewgong"
    case .grimer: return "Grimer"
    case .muk: return "Muk"
    case .shellder: return "Shellder"
    case .cloyster: return "Cloyster"
    case .gastly: return "Gastly"
    case .haunter: return "Haunter"
    case .gengar: return "Gengar"
    case .onix: return "Onix"
    case .drowzee: return "Drowzee"
    case .hypno: return "Hypno"
    case .krabby: return "Krabby"
    case .kingler: return "Kingler"
    case .voltorb: return "Voltorb"
    case .electrode: return "Electrode"
    case .exeggcute: return "Exeggcute"
    case .exeggutor: return "Exeggutor"
    case .cubone: return "Cubone"
    case .marowak: return "Marowak"
    case .hitmonlee: return "Hitmonlee"
    case .hitmonchan: return "Hitmonchan"
    case .lickitung: return "Lickitung"
    case .koffing: return "Koffing"
    case .weezing: return "Weezing"
    case .rhyhorn: return "Rhyhorn"
    case .rhydon: return "Rhydon"
    case .chansey: return "Chansey"
    case .tangela: return "Tangela"
    case .kangaskhan: return "Kangaskhan"
    case .horsea: return "Horsea"
    case .seadra: return "Seadra"
    case .goldeen: return "Goldeen"
    case .seaking: return "Seaking"
    case .staryu: return "Staryu"
    case .starmie: return "Starmie"
    case .mr_mime: return "Mr Mime"
    case .scyther: return "Scyther"
    case .jynx: return "Jynx"
    case .electabuzz: return "Electabuzz"
    case .magmar: return "Magmar"
    case .pinsir: return "Pinsir"
    case .tauros: return "Tauros"
    case .magikarp: return "Magikarp"
    case .gyarados: return "Gyarados"
    case .lapras: return "Lapras"
    case .ditto: return "Ditto"
    case .eevee: return "Eevee"
    case .vaporeon: return "Vaporeon"
    case .jolteon: return "Jolteon"
    case .flareon: return "Flareon"
    case .porygon: return "Porygon"
    case .omanyte: return "Omanyte"
    case .omastar: return "Omastar"
    case .kabuto: return "Kabuto"
    case .kabutops: return "Kabutops"
    case .aerodactyl: return "Aerodactyl"
    case .snorlax: return "Snorlax"
    case .articuno: return "Articuno"
    case .zapdos: return "Zapdos"
    case .moltres: return "Moltres"
    case .dratini: return "Dratini"
    case .dragonair: return "Dragonair"
    case .dragonite: return "Dragonite"
    case .mewtwo: return "Mewtwo"
    case .mew: return "Mew"
    case .chikorita: return "Chikorita"
    case .bayleef: return "Bayleef"
    case .meganium: return "Meganium"
    case .cyndaquil: return "Cyndaquil"
    case .quilava: return "Quilava"
    case .typhlosion: return "Typhlosion"
    case .totodile: return "Totodile"
    case .croconaw: return "Croconaw"
    case .feraligatr: return "Feraligatr"
    case .sentret: return "Sentret"
    case .furret: return "Furret"
    case .hoothoot: return "Hoothoot"
    case .noctowl: return "Noctowl"
    case .ledyba: return "Ledyba"
    case .ledian: return "Ledian"
    case .spinarak: return "Spinarak"
    case .ariados: return "Ariados"
    case .crobat: return "Crobat"
    case .chinchou: return "Chinchou"
    case .lanturn: return "Lanturn"
    case .pichu: return "Pichu"
    case .cleffa: return "Cleffa"
    case .igglybuff: return "Igglybuff"
    case .togepi: return "Togepi"
    case .togetic: return "Togetic"
    case .natu: return "Natu"
    case .xatu: return "Xatu"
    case .mareep: return "Mareep"
    case .flaaffy: return "Flaaffy"
    case .ampharos: return "Ampharos"
    case .bellossom: return "Bellossom"
    case .marill: return "Marill"
    case .azumarill: return "Azumarill"
    case .sudowoodo: return "Sudowoodo"
    case .politoed: return "Politoed"
    case .hoppip: return "Hoppip"
    case .skiploom: return "Skiploom"
    case .jumpluff: return "Jumpluff"
    case .aipom: return "Aipom"
    case .sunkern: return "Sunkern"
    case .sunflora: return "Sunflora"
    case .yanma: return "Yanma"
    case .wooper: return "Wooper"
    case .quagsire: return "Quagsire"
    case .espeon: return "Espeon"
    case .umbreon: return "Umbreon"
    case .murkrow: return "Murkrow"
    case .slowking: return "Slowking"
    case .misdreavus: return "Misdreavus"
    case .unown: return "Unown"
    case .wobbuffet: return "Wobbuffet"
    case .girafarig: return "Girafarig"
    case .pineco: return "Pineco"
    case .forretress: return "Forretress"
    case .dunsparce: return "Dunsparce"
    case .gligar: return "Gligar"
    case .steelix: return "Steelix"
    case .snubbull: return "Snubbull"
    case .granbull: return "Granbull"
    case .qwilfish: return "Qwilfish"
    case .scizor: return "Scizor"
    case .shuckle: return "Shuckle"
    case .heracross: return "Heracross"
    case .sneasel: return "Sneasel"
    case .teddiursa: return "Teddiursa"
    case .ursaring: return "Ursaring"
    case .slugma: return "Slugma"
    case .magcargo: return "Magcargo"
    case .swinub: return "Swinub"
    case .piloswine: return "Piloswine"
    case .corsola: return "Corsola"
    case .remoraid: return "Remoraid"
    case .octillery: return "Octillery"
    case .delibird: return "Delibird"
    case .mantine: return "Mantine"
    case .skarmory: return "Skarmory"
    case .houndour: return "Houndour"
    case .houndoom: return "Houndoom"
    case .kingdra: return "Kingdra"
    case .phanpy: return "Phanpy"
    case .donphan: return "Donphan"
    case .porygon2: return "Porygon2"
    case .stantler: return "Stantler"
    case .smeargle: return "Smeargle"
    case .tyrogue: return "Tyrogue"
    case .hitmontop: return "Hitmontop"
    case .smoochum: return "Smoochum"
    case .elekid: return "Elekid"
    case .magby: return "Magby"
    case .miltank: return "Miltank"
    case .blissey: return "Blissey"
    case .raikou: return "Raikou"
    case .entei: return "Entei"
    case .suicune: return "Suicune"
    case .larvitar: return "Larvitar"
    case .pupitar: return "Pupitar"
    case .tyranitar: return "Tyranitar"
    case .lugia: return "Lugia"
    case .ho_oh: return "Ho Oh"
    case .celebi: return "Celebi"
    case .treecko: return "Treecko"
    case .grovyle: return "Grovyle"
    case .sceptile: return "Sceptile"
    case .torchic: return "Torchic"
    case .combusken: return "Combusken"
    case .blaziken: return "Blaziken"
    case .mudkip: return "Mudkip"
    case .marshtomp: return "Marshtomp"
    case .swampert: return "Swampert"
    case .poochyena: return "Poochyena"
    case .mightyena: return "Mightyena"
    case .zigzagoon: return "Zigzagoon"
    case .linoone: return "Linoone"
    case .wurmple: return "Wurmple"
    case .silcoon: return "Silcoon"
    case .beautifly: return "Beautifly"
    case .cascoon: return "Cascoon"
    case .dustox: return "Dustox"
    case .lotad: return "Lotad"
    case .lombre: return "Lombre"
    case .ludicolo: return "Ludicolo"
    case .seedot: return "Seedot"
    case .nuzleaf: return "Nuzleaf"
    case .shiftry: return "Shiftry"
    case .taillow: return "Taillow"
    case .swellow: return "Swellow"
    case .wingull: return "Wingull"
    case .pelipper: return "Pelipper"
    case .ralts: return "Ralts"
    case .kirlia: return "Kirlia"
    case .gardevoir: return "Gardevoir"
    case .surskit: return "Surskit"
    case .masquerain: return "Masquerain"
    case .shroomish: return "Shroomish"
    case .breloom: return "Breloom"
    case .slakoth: return "Slakoth"
    case .vigoroth: return "Vigoroth"
    case .slaking: return "Slaking"
    case .nincada: return "Nincada"
    case .ninjask: return "Ninjask"
    case .shedinja: return "Shedinja"
    case .whismur: return "Whismur"
    case .loudred: return "Loudred"
    case .exploud: return "Exploud"
    case .makuhita: return "Makuhita"
    case .hariyama: return "Hariyama"
    case .azurill: return "Azurill"
    case .nosepass: return "Nosepass"
    case .skitty: return "Skitty"
    case .delcatty: return "Delcatty"
    case .sableye: return "Sableye"
    case .mawile: return "Mawile"
    case .aron: return "Aron"
    case .lairon: return "Lairon"
    case .aggron: return "Aggron"
    case .meditite: return "Meditite"
    case .medicham: return "Medicham"
    case .electrike: return "Electrike"
    case .manectric: return "Manectric"
    case .plusle: return "Plusle"
    case .minun: return "Minun"
    case .volbeat: return "Volbeat"
    case .illumise: return "Illumise"
    case .roselia: return "Roselia"
    case .gulpin: return "Gulpin"
    case .swalot: return "Swalot"
    case .carvanha: return "Carvanha"
    case .sharpedo: return "Sharpedo"
    case .wailmer: return "Wailmer"
    case .wailord: return "Wailord"
    case .numel: return "Numel"
    case .camerupt: return "Camerupt"
    case .torkoal: return "Torkoal"
    case .spoink: return "Spoink"
    case .grumpig: return "Grumpig"
    case .spinda: return "Spinda"
    case .trapinch: return "Trapinch"
    case .vibrava: return "Vibrava"
    case .flygon: return "Flygon"
    case .cacnea: return "Cacnea"
    case .cacturne: return "Cacturne"
    case .swablu: return "Swablu"
    case .altaria: return "Altaria"
    case .zangoose: return "Zangoose"
    case .seviper: return "Seviper"
    case .lunatone: return "Lunatone"
    case .solrock: return "Solrock"
    case .barboach: return "Barboach"
    case .whiscash: return "Whiscash"
    case .corphish: return "Corphish"
    case .crawdaunt: return "Crawdaunt"
    case .baltoy: return "Baltoy"
    case .claydol: return "Claydol"
    case .lileep: return "Lileep"
    case .cradily: return "Cradily"
    case .anorith: return "Anorith"
    case .armaldo: return "Armaldo"
    case .feebas: return "Feebas"
    case .milotic: return "Milotic"
    case .castform: return "Castform"
    case .kecleon: return "Kecleon"
    case .shuppet: return "Shuppet"
    case .banette: return "Banette"
    case .duskull: return "Duskull"
    case .dusclops: return "Dusclops"
    case .tropius: return "Tropius"
    case .chimecho: return "Chimecho"
    case .absol: return "Absol"
    case .wynaut: return "Wynaut"
    case .snorunt: return "Snorunt"
    case .glalie: return "Glalie"
    case .spheal: return "Spheal"
    case .sealeo: return "Sealeo"
    case .walrein: return "Walrein"
    case .clamperl: return "Clamperl"
    case .huntail: return "Huntail"
    case .gorebyss: return "Gorebyss"
    case .relicanth: return "Relicanth"
    case .luvdisc: return "Luvdisc"
    case .bagon: return "Bagon"
    case .shelgon: return "Shelgon"
    case .salamence: return "Salamence"
    case .beldum: return "Beldum"
    case .metang: return "Metang"
    case .metagross: return "Metagross"
    case .regirock: return "Regirock"
    case .regice: return "Regice"
    case .registeel: return "Registeel"
    case .latias: return "Latias"
    case .latios: return "Latios"
    case .kyogre: return "Kyogre"
    case .groudon: return "Groudon"
    case .rayquaza: return "Rayquaza"
    case .jirachi: return "Jirachi"
    case .deoxys_normal: return "Deoxys Normal"
    case .turtwig: return "Turtwig"
    case .grotle: return "Grotle"
    case .torterra: return "Torterra"
    case .chimchar: return "Chimchar"
    case .monferno: return "Monferno"
    case .infernape: return "Infernape"
    case .piplup: return "Piplup"
    case .prinplup: return "Prinplup"
    case .empoleon: return "Empoleon"
    case .starly: return "Starly"
    case .staravia: return "Staravia"
    case .staraptor: return "Staraptor"
    case .bidoof: return "Bidoof"
    case .bibarel: return "Bibarel"
    case .kricketot: return "Kricketot"
    case .kricketune: return "Kricketune"
    case .shinx: return "Shinx"
    case .luxio: return "Luxio"
    case .luxray: return "Luxray"
    case .budew: return "Budew"
    case .roserade: return "Roserade"
    case .cranidos: return "Cranidos"
    case .rampardos: return "Rampardos"
    case .shieldon: return "Shieldon"
    case .bastiodon: return "Bastiodon"
    case .burmy: return "Burmy"
    case .wormadam_plant: return "Wormadam Plant"
    case .mothim: return "Mothim"
    case .combee: return "Combee"
    case .vespiquen: return "Vespiquen"
    case .pachirisu: return "Pachirisu"
    case .buizel: return "Buizel"
    case .floatzel: return "Floatzel"
    case .cherubi: return "Cherubi"
    case .cherrim: return "Cherrim"
    case .shellos: return "Shellos"
    case .gastrodon: return "Gastrodon"
    case .ambipom: return "Ambipom"
    case .drifloon: return "Drifloon"
    case .drifblim: return "Drifblim"
    case .buneary: return "Buneary"
    case .lopunny: return "Lopunny"
    case .mismagius: return "Mismagius"
    case .honchkrow: return "Honchkrow"
    case .glameow: return "Glameow"
    case .purugly: return "Purugly"
    case .chingling: return "Chingling"
    case .stunky: return "Stunky"
    case .skuntank: return "Skuntank"
    case .bronzor: return "Bronzor"
    case .bronzong: return "Bronzong"
    case .bonsly: return "Bonsly"
    case .mime_jr: return "Mime Jr"
    case .happiny: return "Happiny"
    case .chatot: return "Chatot"
    case .spiritomb: return "Spiritomb"
    case .gible: return "Gible"
    case .gabite: return "Gabite"
    case .garchomp: return "Garchomp"
    case .munchlax: return "Munchlax"
    case .riolu: return "Riolu"
    case .lucario: return "Lucario"
    case .hippopotas: return "Hippopotas"
    case .hippowdon: return "Hippowdon"
    case .skorupi: return "Skorupi"
    case .drapion: return "Drapion"
    case .croagunk: return "Croagunk"
    case .toxicroak: return "Toxicroak"
    case .carnivine: return "Carnivine"
    case .finneon: return "Finneon"
    case .lumineon: return "Lumineon"
    case .mantyke: return "Mantyke"
    case .snover: return "Snover"
    case .abomasnow: return "Abomasnow"
    case .weavile: return "Weavile"
    case .magnezone: return "Magnezone"
    case .lickilicky: return "Lickilicky"
    case .rhyperior: return "Rhyperior"
    case .tangrowth: return "Tangrowth"
    case .electivire: return "Electivire"
    case .magmortar: return "Magmortar"
    case .togekiss: return "Togekiss"
    case .yanmega: return "Yanmega"
    case .leafeon: return "Leafeon"
    case .glaceon: return "Glaceon"
    case .gliscor: return "Gliscor"
    case .mamoswine: return "Mamoswine"
    case .porygon_z: return "Porygon Z"
    case .gallade: return "Gallade"
    case .probopass: return "Probopass"
    case .dusknoir: return "Dusknoir"
    case .froslass: return "Froslass"
    case .rotom: return "Rotom"
    case .uxie: return "Uxie"
    case .mesprit: return "Mesprit"
    case .azelf: return "Azelf"
    case .dialga: return "Dialga"
    case .palkia: return "Palkia"
    case .heatran: return "Heatran"
    case .regigigas: return "Regigigas"
    case .giratina_altered: return "Giratina Altered"
    case .cresselia: return "Cresselia"
    case .phione: return "Phione"
    case .manaphy: return "Manaphy"
    case .darkrai: return "Darkrai"
    case .shaymin_land: return "Shaymin Land"
    case .arceus: return "Arceus"
    case .victini: return "Victini"
    case .snivy: return "Snivy"
    case .servine: return "Servine"
    case .serperior: return "Serperior"
    case .tepig: return "Tepig"
    case .pignite: return "Pignite"
    case .emboar: return "Emboar"
    case .oshawott: return "Oshawott"
    case .dewott: return "Dewott"
    case .samurott: return "Samurott"
    case .patrat: return "Patrat"
    case .watchog: return "Watchog"
    case .lillipup: return "Lillipup"
    case .herdier: return "Herdier"
    case .stoutland: return "Stoutland"
    case .purrloin: return "Purrloin"
    case .liepard: return "Liepard"
    case .pansage: return "Pansage"
    case .simisage: return "Simisage"
    case .pansear: return "Pansear"
    case .simisear: return "Simisear"
    case .panpour: return "Panpour"
    case .simipour: return "Simipour"
    case .munna: return "Munna"
    case .musharna: return "Musharna"
    case .pidove: return "Pidove"
    case .tranquill: return "Tranquill"
    case .unfezant: return "Unfezant"
    case .blitzle: return "Blitzle"
    case .zebstrika: return "Zebstrika"
    case .roggenrola: return "Roggenrola"
    case .boldore: return "Boldore"
    case .gigalith: return "Gigalith"
    case .woobat: return "Woobat"
    case .swoobat: return "Swoobat"
    case .drilbur: return "Drilbur"
    case .excadrill: return "Excadrill"
    case .audino: return "Audino"
    case .timburr: return "Timburr"
    case .gurdurr: return "Gurdurr"
    case .conkeldurr: return "Conkeldurr"
    case .tympole: return "Tympole"
    case .palpitoad: return "Palpitoad"
    case .seismitoad: return "Seismitoad"
    case .throh: return "Throh"
    case .sawk: return "Sawk"
    case .sewaddle: return "Sewaddle"
    case .swadloon: return "Swadloon"
    case .leavanny: return "Leavanny"
    case .venipede: return "Venipede"
    case .whirlipede: return "Whirlipede"
    case .scolipede: return "Scolipede"
    case .cottonee: return "Cottonee"
    case .whimsicott: return "Whimsicott"
    case .petilil: return "Petilil"
    case .lilligant: return "Lilligant"
    case .basculin_red_striped: return "Basculin Red Striped"
    case .sandile: return "Sandile"
    case .krokorok: return "Krokorok"
    case .krookodile: return "Krookodile"
    case .darumaka: return "Darumaka"
    case .darmanitan_standard: return "Darmanitan Standard"
    case .maractus: return "Maractus"
    case .dwebble: return "Dwebble"
    case .crustle: return "Crustle"
    case .scraggy: return "Scraggy"
    case .scrafty: return "Scrafty"
    case .sigilyph: return "Sigilyph"
    case .yamask: return "Yamask"
    case .cofagrigus: return "Cofagrigus"
    case .tirtouga: return "Tirtouga"
    case .carracosta: return "Carracosta"
    case .archen: return "Archen"
    case .archeops: return "Archeops"
    case .trubbish: return "Trubbish"
    case .garbodor: return "Garbodor"
    case .zorua: return "Zorua"
    case .zoroark: return "Zoroark"
    case .minccino: return "Minccino"
    case .cinccino: return "Cinccino"
    case .gothita: return "Gothita"
    case .gothorita: return "Gothorita"
    case .gothitelle: return "Gothitelle"
    case .solosis: return "Solosis"
    case .duosion: return "Duosion"
    case .reuniclus: return "Reuniclus"
    case .ducklett: return "Ducklett"
    case .swanna: return "Swanna"
    case .vanillite: return "Vanillite"
    case .vanillish: return "Vanillish"
    case .vanilluxe: return "Vanilluxe"
    case .deerling: return "Deerling"
    case .sawsbuck: return "Sawsbuck"
    case .emolga: return "Emolga"
    case .karrablast: return "Karrablast"
    case .escavalier: return "Escavalier"
    case .foongus: return "Foongus"
    case .amoonguss: return "Amoonguss"
    case .frillish: return "Frillish"
    case .jellicent: return "Jellicent"
    case .alomomola: return "Alomomola"
    case .joltik: return "Joltik"
    case .galvantula: return "Galvantula"
    case .ferroseed: return "Ferroseed"
    case .ferrothorn: return "Ferrothorn"
    case .klink: return "Klink"
    case .klang: return "Klang"
    case .klinklang: return "Klinklang"
    case .tynamo: return "Tynamo"
    case .eelektrik: return "Eelektrik"
    case .eelektross: return "Eelektross"
    case .elgyem: return "Elgyem"
    case .beheeyem: return "Beheeyem"
    case .litwick: return "Litwick"
    case .lampent: return "Lampent"
    case .chandelure: return "Chandelure"
    case .axew: return "Axew"
    case .fraxure: return "Fraxure"
    case .haxorus: return "Haxorus"
    case .cubchoo: return "Cubchoo"
    case .beartic: return "Beartic"
    case .cryogonal: return "Cryogonal"
    case .shelmet: return "Shelmet"
    case .accelgor: return "Accelgor"
    case .stunfisk: return "Stunfisk"
    case .mienfoo: return "Mienfoo"
    case .mienshao: return "Mienshao"
    case .druddigon: return "Druddigon"
    case .golett: return "Golett"
    case .golurk: return "Golurk"
    case .pawniard: return "Pawniard"
    case .bisharp: return "Bisharp"
    case .bouffalant: return "Bouffalant"
    case .rufflet: return "Rufflet"
    case .braviary: return "Braviary"
    case .vullaby: return "Vullaby"
    case .mandibuzz: return "Mandibuzz"
    case .heatmor: return "Heatmor"
    case .durant: return "Durant"
    case .deino: return "Deino"
    case .zweilous: return "Zweilous"
    case .hydreigon: return "Hydreigon"
    case .larvesta: return "Larvesta"
    case .volcarona: return "Volcarona"
    case .cobalion: return "Cobalion"
    case .terrakion: return "Terrakion"
    case .virizion: return "Virizion"
    case .tornadus_incarnate: return "Tornadus Incarnate"
    case .thundurus_incarnate: return "Thundurus Incarnate"
    case .reshiram: return "Reshiram"
    case .zekrom: return "Zekrom"
    case .landorus_incarnate: return "Landorus Incarnate"
    case .kyurem: return "Kyurem"
    case .keldeo_ordinary: return "Keldeo Ordinary"
    case .meloetta_aria: return "Meloetta Aria"
    case .genesect: return "Genesect"
    case .chespin: return "Chespin"
    case .quilladin: return "Quilladin"
    case .chesnaught: return "Chesnaught"
    case .fennekin: return "Fennekin"
    case .braixen: return "Braixen"
    case .delphox: return "Delphox"
    case .froakie: return "Froakie"
    case .frogadier: return "Frogadier"
    case .greninja: return "Greninja"
    case .bunnelby: return "Bunnelby"
    case .diggersby: return "Diggersby"
    case .fletchling: return "Fletchling"
    case .fletchinder: return "Fletchinder"
    case .talonflame: return "Talonflame"
    case .scatterbug: return "Scatterbug"
    case .spewpa: return "Spewpa"
    case .vivillon: return "Vivillon"
    case .litleo: return "Litleo"
    case .pyroar: return "Pyroar"
    case .flabebe: return "Flabebe"
    case .floette: return "Floette"
    case .florges: return "Florges"
    case .skiddo: return "Skiddo"
    case .gogoat: return "Gogoat"
    case .pancham: return "Pancham"
    case .pangoro: return "Pangoro"
    case .furfrou: return "Furfrou"
    case .espurr: return "Espurr"
    case .meowstic_male: return "Meowstic Male"
    case .honedge: return "Honedge"
    case .doublade: return "Doublade"
    case .aegislash_shield: return "Aegislash Shield"
    case .spritzee: return "Spritzee"
    case .aromatisse: return "Aromatisse"
    case .swirlix: return "Swirlix"
    case .slurpuff: return "Slurpuff"
    case .inkay: return "Inkay"
    case .malamar: return "Malamar"
    case .binacle: return "Binacle"
    case .barbaracle: return "Barbaracle"
    case .skrelp: return "Skrelp"
    case .dragalge: return "Dragalge"
    case .clauncher: return "Clauncher"
    case .clawitzer: return "Clawitzer"
    case .helioptile: return "Helioptile"
    case .heliolisk: return "Heliolisk"
    case .tyrunt: return "Tyrunt"
    case .tyrantrum: return "Tyrantrum"
    case .amaura: return "Amaura"
    case .aurorus: return "Aurorus"
    case .sylveon: return "Sylveon"
    case .hawlucha: return "Hawlucha"
    case .dedenne: return "Dedenne"
    case .carbink: return "Carbink"
    case .goomy: return "Goomy"
    case .sliggoo: return "Sliggoo"
    case .goodra: return "Goodra"
    case .klefki: return "Klefki"
    case .phantump: return "Phantump"
    case .trevenant: return "Trevenant"
    case .pumpkaboo_average: return "Pumpkaboo Average"
    case .gourgeist_average: return "Gourgeist Average"
    case .bergmite: return "Bergmite"
    case .avalugg: return "Avalugg"
    case .noibat: return "Noibat"
    case .noivern: return "Noivern"
    case .xerneas: return "Xerneas"
    case .yveltal: return "Yveltal"
    case .zygarde_50: return "Zygarde 50"
    case .diancie: return "Diancie"
    case .hoopa: return "Hoopa"
    case .volcanion: return "Volcanion"
    case .rowlet: return "Rowlet"
    case .dartrix: return "Dartrix"
    case .decidueye: return "Decidueye"
    case .litten: return "Litten"
    case .torracat: return "Torracat"
    case .incineroar: return "Incineroar"
    case .popplio: return "Popplio"
    case .brionne: return "Brionne"
    case .primarina: return "Primarina"
    case .pikipek: return "Pikipek"
    case .trumbeak: return "Trumbeak"
    case .toucannon: return "Toucannon"
    case .yungoos: return "Yungoos"
    case .gumshoos: return "Gumshoos"
    case .grubbin: return "Grubbin"
    case .charjabug: return "Charjabug"
    case .vikavolt: return "Vikavolt"
    case .crabrawler: return "Crabrawler"
    case .crabominable: return "Crabominable"
    case .oricorio_baile: return "Oricorio Baile"
    case .cutiefly: return "Cutiefly"
    case .ribombee: return "Ribombee"
    case .rockruff: return "Rockruff"
    case .lycanroc_midday: return "Lycanroc Midday"
    case .wishiwashi_solo: return "Wishiwashi Solo"
    case .mareanie: return "Mareanie"
    case .toxapex: return "Toxapex"
    case .mudbray: return "Mudbray"
    case .mudsdale: return "Mudsdale"
    case .dewpider: return "Dewpider"
    case .araquanid: return "Araquanid"
    case .fomantis: return "Fomantis"
    case .lurantis: return "Lurantis"
    case .morelull: return "Morelull"
    case .shiinotic: return "Shiinotic"
    case .salandit: return "Salandit"
    case .salazzle: return "Salazzle"
    case .stufful: return "Stufful"
    case .bewear: return "Bewear"
    case .bounsweet: return "Bounsweet"
    case .steenee: return "Steenee"
    case .tsareena: return "Tsareena"
    case .comfey: return "Comfey"
    case .oranguru: return "Oranguru"
    case .passimian: return "Passimian"
    case .wimpod: return "Wimpod"
    case .golisopod: return "Golisopod"
    case .sandygast: return "Sandygast"
    case .palossand: return "Palossand"
    case .pyukumuku: return "Pyukumuku"
    case .type_null: return "Type Null"
    case .silvally: return "Silvally"
    case .minior_red_meteor: return "Minior Red Meteor"
    case .komala: return "Komala"
    case .turtonator: return "Turtonator"
    case .togedemaru: return "Togedemaru"
    case .mimikyu_disguised: return "Mimikyu Disguised"
    case .bruxish: return "Bruxish"
    case .drampa: return "Drampa"
    case .dhelmise: return "Dhelmise"
    case .jangmo_o: return "Jangmo O"
    case .hakamo_o: return "Hakamo O"
    case .kommo_o: return "Kommo O"
    case .tapu_koko: return "Tapu Koko"
    case .tapu_lele: return "Tapu Lele"
    case .tapu_bulu: return "Tapu Bulu"
    case .tapu_fini: return "Tapu Fini"
    case .cosmog: return "Cosmog"
    case .cosmoem: return "Cosmoem"
    case .solgaleo: return "Solgaleo"
    case .lunala: return "Lunala"
    case .nihilego: return "Nihilego"
    case .buzzwole: return "Buzzwole"
    case .pheromosa: return "Pheromosa"
    case .xurkitree: return "Xurkitree"
    case .celesteela: return "Celesteela"
    case .kartana: return "Kartana"
    case .guzzlord: return "Guzzlord"
    case .necrozma: return "Necrozma"
    case .magearna: return "Magearna"
    case .marshadow: return "Marshadow"
    case .poipole: return "Poipole"
    case .naganadel: return "Naganadel"
    case .stakataka: return "Stakataka"
    case .blacephalon: return "Blacephalon"
    case .zeraora: return "Zeraora"
    case .meltan: return "Meltan"
    case .melmetal: return "Melmetal"
    case .grookey: return "Grookey"
    case .thwackey: return "Thwackey"
    case .rillaboom: return "Rillaboom"
    case .scorbunny: return "Scorbunny"
    case .raboot: return "Raboot"
    case .cinderace: return "Cinderace"
    case .sobble: return "Sobble"
    case .drizzile: return "Drizzile"
    case .inteleon: return "Inteleon"
    case .skwovet: return "Skwovet"
    case .greedent: return "Greedent"
    case .rookidee: return "Rookidee"
    case .corvisquire: return "Corvisquire"
    case .corviknight: return "Corviknight"
    case .blipbug: return "Blipbug"
    case .dottler: return "Dottler"
    case .orbeetle: return "Orbeetle"
    case .nickit: return "Nickit"
    case .thievul: return "Thievul"
    case .gossifleur: return "Gossifleur"
    case .eldegoss: return "Eldegoss"
    case .wooloo: return "Wooloo"
    case .dubwool: return "Dubwool"
    case .chewtle: return "Chewtle"
    case .drednaw: return "Drednaw"
    case .yamper: return "Yamper"
    case .boltund: return "Boltund"
    case .rolycoly: return "Rolycoly"
    case .carkol: return "Carkol"
    case .coalossal: return "Coalossal"
    case .applin: return "Applin"
    case .flapple: return "Flapple"
    case .appletun: return "Appletun"
    case .silicobra: return "Silicobra"
    case .sandaconda: return "Sandaconda"
    case .cramorant: return "Cramorant"
    case .arrokuda: return "Arrokuda"
    case .barraskewda: return "Barraskewda"
    case .toxel: return "Toxel"
    case .toxtricity_amped: return "Toxtricity Amped"
    case .sizzlipede: return "Sizzlipede"
    case .centiskorch: return "Centiskorch"
    case .clobbopus: return "Clobbopus"
    case .grapploct: return "Grapploct"
    case .sinistea: return "Sinistea"
    case .polteageist: return "Polteageist"
    case .hatenna: return "Hatenna"
    case .hattrem: return "Hattrem"
    case .hatterene: return "Hatterene"
    case .impidimp: return "Impidimp"
    case .morgrem: return "Morgrem"
    case .grimmsnarl: return "Grimmsnarl"
    case .obstagoon: return "Obstagoon"
    case .perrserker: return "Perrserker"
    case .cursola: return "Cursola"
    case .sirfetchd: return "Sirfetchd"
    case .mr_rime: return "Mr Rime"
    case .runerigus: return "Runerigus"
    case .milcery: return "Milcery"
    case .alcremie: return "Alcremie"
    case .falinks: return "Falinks"
    case .pincurchin: return "Pincurchin"
    case .snom: return "Snom"
    case .frosmoth: return "Frosmoth"
    case .stonjourner: return "Stonjourner"
    case .eiscue_ice: return "Eiscue Ice"
    case .indeedee_male: return "Indeedee Male"
    case .morpeko_full_belly: return "Morpeko Full Belly"
    case .cufant: return "Cufant"
    case .copperajah: return "Copperajah"
    case .dracozolt: return "Dracozolt"
    case .arctozolt: return "Arctozolt"
    case .dracovish: return "Dracovish"
    case .arctovish: return "Arctovish"
    case .duraludon: return "Duraludon"
    case .dreepy: return "Dreepy"
    case .drakloak: return "Drakloak"
    case .dragapult: return "Dragapult"
    case .zacian: return "Zacian"
    case .zamazenta: return "Zamazenta"
    case .eternatus: return "Eternatus"
    case .kubfu: return "Kubfu"
    case .urshifu_single_strike: return "Urshifu Single Strike"
    case .zarude: return "Zarude"
    case .regieleki: return "Regieleki"
    case .regidrago: return "Regidrago"
    case .glastrier: return "Glastrier"
    case .spectrier: return "Spectrier"
    case .calyrex: return "Calyrex"
    case .wyrdeer: return "Wyrdeer"
    case .kleavor: return "Kleavor"
    case .ursaluna: return "Ursaluna"
    case .basculegion_male: return "Basculegion Male"
    case .sneasler: return "Sneasler"
    case .overqwil: return "Overqwil"
    case .enamorus_incarnate: return "Enamorus Incarnate"
    case .sprigatito: return "Sprigatito"
    case .floragato: return "Floragato"
    case .meowscarada: return "Meowscarada"
    case .fuecoco: return "Fuecoco"
    case .crocalor: return "Crocalor"
    case .skeledirge: return "Skeledirge"
    case .quaxly: return "Quaxly"
    case .quaxwell: return "Quaxwell"
    case .quaquaval: return "Quaquaval"
    case .lechonk: return "Lechonk"
    case .oinkologne: return "Oinkologne"
    case .tarountula: return "Tarountula"
    case .spidops: return "Spidops"
    case .nymble: return "Nymble"
    case .lokix: return "Lokix"
    case .pawmi: return "Pawmi"
    case .pawmo: return "Pawmo"
    case .pawmot: return "Pawmot"
    case .tandemaus: return "Tandemaus"
    case .maushold: return "Maushold"
    case .fidough: return "Fidough"
    case .dachsbun: return "Dachsbun"
    case .smoliv: return "Smoliv"
    case .dolliv: return "Dolliv"
    case .arboliva: return "Arboliva"
    case .squawkabilly: return "Squawkabilly"
    case .nacli: return "Nacli"
    case .naclstack: return "Naclstack"
    case .garganacl: return "Garganacl"
    case .charcadet: return "Charcadet"
    case .armarouge: return "Armarouge"
    case .ceruledge: return "Ceruledge"
    case .tadbulb: return "Tadbulb"
    case .bellibolt: return "Bellibolt"
    case .wattrel: return "Wattrel"
    case .kilowattrel: return "Kilowattrel"
    case .maschiff: return "Maschiff"
    case .mabosstiff: return "Mabosstiff"
    case .shroodle: return "Shroodle"
    case .grafaiai: return "Grafaiai"
    case .bramblin: return "Bramblin"
    case .brambleghast: return "Brambleghast"
    case .toedscool: return "Toedscool"
    case .toedscruel: return "Toedscruel"
    case .klawf: return "Klawf"
    case .capsakid: return "Capsakid"
    case .scovillain: return "Scovillain"
    case .rellor: return "Rellor"
    case .rabsca: return "Rabsca"
    case .flittle: return "Flittle"
    case .espathra: return "Espathra"
    case .tinkatink: return "Tinkatink"
    case .tinkatuff: return "Tinkatuff"
    case .tinkaton: return "Tinkaton"
    case .wiglett: return "Wiglett"
    case .wugtrio: return "Wugtrio"
    case .bombirdier: return "Bombirdier"
    case .finizen: return "Finizen"
    case .palafin: return "Palafin"
    case .varoom: return "Varoom"
    case .revavroom: return "Revavroom"
    case .cyclizar: return "Cyclizar"
    case .orthworm: return "Orthworm"
    case .glimmet: return "Glimmet"
    case .glimmora: return "Glimmora"
    case .greavard: return "Greavard"
    case .houndstone: return "Houndstone"
    case .flamigo: return "Flamigo"
    case .cetoddle: return "Cetoddle"
    case .cetitan: return "Cetitan"
    case .veluza: return "Veluza"
    case .dondozo: return "Dondozo"
    case .tatsugiri: return "Tatsugiri"
    case .annihilape: return "Annihilape"
    case .clodsire: return "Clodsire"
    case .farigiraf: return "Farigiraf"
    case .dudunsparce: return "Dudunsparce"
    case .kingambit: return "Kingambit"
    case .great_tusk: return "Great Tusk"
    case .scream_tail: return "Scream Tail"
    case .brute_bonnet: return "Brute Bonnet"
    case .flutter_mane: return "Flutter Mane"
    case .slither_wing: return "Slither Wing"
    case .sandy_shocks: return "Sandy Shocks"
    case .iron_treads: return "Iron Treads"
    case .iron_bundle: return "Iron Bundle"
    case .iron_hands: return "Iron Hands"
    case .iron_jugulis: return "Iron Jugulis"
    case .iron_moth: return "Iron Moth"
    case .iron_thorns: return "Iron Thorns"
    case .frigibax: return "Frigibax"
    case .arctibax: return "Arctibax"
    case .baxcalibur: return "Baxcalibur"
    case .gimmighoul: return "Gimmighoul"
    case .gholdengo: return "Gholdengo"
    case .wo_chien: return "Wo Chien"
    case .chien_pao: return "Chien Pao"
    case .ting_lu: return "Ting Lu"
    case .chi_yu: return "Chi Yu"
    case .roaring_moon: return "Roaring Moon"
    case .iron_valiant: return "Iron Valiant"
    case .koraidon: return "Koraidon"
    case .miraidon: return "Miraidon"
    case .walking_wake: return "Walking Wake"
    case .iron_leaves: return "Iron Leaves"
    case .dipplin: return "Dipplin"
    case .poltchageist: return "Poltchageist"
    case .sinistcha: return "Sinistcha"
    case .okidogi: return "Okidogi"
    case .munkidori: return "Munkidori"
    case .fezandipiti: return "Fezandipiti"
    case .ogerpon: return "Ogerpon"
    case .archaludon: return "Archaludon"
    case .hydrapple: return "Hydrapple"
    case .gouging_fire: return "Gouging Fire"
    case .raging_bolt: return "Raging Bolt"
    case .iron_boulder: return "Iron Boulder"
    case .iron_crown: return "Iron Crown"
    case .terapagos: return "Terapagos"
    case .pecharunt: return "Pecharunt"
    case .deoxys_attack: return "Deoxys Attack"
    case .deoxys_defense: return "Deoxys Defense"
    case .deoxys_speed: return "Deoxys Speed"
    case .wormadam_sandy: return "Wormadam Sandy"
    case .wormadam_trash: return "Wormadam Trash"
    case .shaymin_sky: return "Shaymin Sky"
    case .giratina_origin: return "Giratina Origin"
    case .rotom_heat: return "Rotom Heat"
    case .rotom_wash: return "Rotom Wash"
    case .rotom_frost: return "Rotom Frost"
    case .rotom_fan: return "Rotom Fan"
    case .rotom_mow: return "Rotom Mow"
    case .castform_sunny: return "Castform Sunny"
    case .castform_rainy: return "Castform Rainy"
    case .castform_snowy: return "Castform Snowy"
    case .basculin_blue_striped: return "Basculin Blue Striped"
    case .darmanitan_zen: return "Darmanitan Zen"
    case .meloetta_pirouette: return "Meloetta Pirouette"
    case .tornadus_therian: return "Tornadus Therian"
    case .thundurus_therian: return "Thundurus Therian"
    case .landorus_therian: return "Landorus Therian"
    case .kyurem_black: return "Kyurem Black"
    case .kyurem_white: return "Kyurem White"
    case .keldeo_resolute: return "Keldeo Resolute"
    case .meowstic_female: return "Meowstic Female"
    case .aegislash_blade: return "Aegislash Blade"
    case .pumpkaboo_small: return "Pumpkaboo Small"
    case .pumpkaboo_large: return "Pumpkaboo Large"
    case .pumpkaboo_super: return "Pumpkaboo Super"
    case .gourgeist_small: return "Gourgeist Small"
    case .gourgeist_large: return "Gourgeist Large"
    case .gourgeist_super: return "Gourgeist Super"
    case .venusaur_mega: return "Venusaur Mega"
    case .charizard_mega_x: return "Charizard Mega X"
    case .charizard_mega_y: return "Charizard Mega Y"
    case .blastoise_mega: return "Blastoise Mega"
    case .alakazam_mega: return "Alakazam Mega"
    case .gengar_mega: return "Gengar Mega"
    case .kangaskhan_mega: return "Kangaskhan Mega"
    case .pinsir_mega: return "Pinsir Mega"
    case .gyarados_mega: return "Gyarados Mega"
    case .aerodactyl_mega: return "Aerodactyl Mega"
    case .mewtwo_mega_x: return "Mewtwo Mega X"
    case .mewtwo_mega_y: return "Mewtwo Mega Y"
    case .ampharos_mega: return "Ampharos Mega"
    case .scizor_mega: return "Scizor Mega"
    case .heracross_mega: return "Heracross Mega"
    case .houndoom_mega: return "Houndoom Mega"
    case .tyranitar_mega: return "Tyranitar Mega"
    case .blaziken_mega: return "Blaziken Mega"
    case .gardevoir_mega: return "Gardevoir Mega"
    case .mawile_mega: return "Mawile Mega"
    case .aggron_mega: return "Aggron Mega"
    case .medicham_mega: return "Medicham Mega"
    case .manectric_mega: return "Manectric Mega"
    case .banette_mega: return "Banette Mega"
    case .absol_mega: return "Absol Mega"
    case .garchomp_mega: return "Garchomp Mega"
    case .lucario_mega: return "Lucario Mega"
    case .abomasnow_mega: return "Abomasnow Mega"
    case .floette_eternal: return "Floette Eternal"
    case .latias_mega: return "Latias Mega"
    case .latios_mega: return "Latios Mega"
    case .swampert_mega: return "Swampert Mega"
    case .sceptile_mega: return "Sceptile Mega"
    case .sableye_mega: return "Sableye Mega"
    case .altaria_mega: return "Altaria Mega"
    case .gallade_mega: return "Gallade Mega"
    case .audino_mega: return "Audino Mega"
    case .sharpedo_mega: return "Sharpedo Mega"
    case .slowbro_mega: return "Slowbro Mega"
    case .steelix_mega: return "Steelix Mega"
    case .pidgeot_mega: return "Pidgeot Mega"
    case .glalie_mega: return "Glalie Mega"
    case .diancie_mega: return "Diancie Mega"
    case .metagross_mega: return "Metagross Mega"
    case .kyogre_primal: return "Kyogre Primal"
    case .groudon_primal: return "Groudon Primal"
    case .rayquaza_mega: return "Rayquaza Mega"
    case .pikachu_rock_star: return "Pikachu Rock Star"
    case .pikachu_belle: return "Pikachu Belle"
    case .pikachu_pop_star: return "Pikachu Pop Star"
    case .pikachu_phd: return "Pikachu Phd"
    case .pikachu_libre: return "Pikachu Libre"
    case .pikachu_cosplay: return "Pikachu Cosplay"
    case .hoopa_unbound: return "Hoopa Unbound"
    case .camerupt_mega: return "Camerupt Mega"
    case .lopunny_mega: return "Lopunny Mega"
    case .salamence_mega: return "Salamence Mega"
    case .beedrill_mega: return "Beedrill Mega"
    case .rattata_alola: return "Rattata Alola"
    case .raticate_alola: return "Raticate Alola"
    case .raticate_totem_alola: return "Raticate Totem Alola"
    case .pikachu_original_cap: return "Pikachu Original Cap"
    case .pikachu_hoenn_cap: return "Pikachu Hoenn Cap"
    case .pikachu_sinnoh_cap: return "Pikachu Sinnoh Cap"
    case .pikachu_unova_cap: return "Pikachu Unova Cap"
    case .pikachu_kalos_cap: return "Pikachu Kalos Cap"
    case .pikachu_alola_cap: return "Pikachu Alola Cap"
    case .raichu_alola: return "Raichu Alola"
    case .sandshrew_alola: return "Sandshrew Alola"
    case .sandslash_alola: return "Sandslash Alola"
    case .vulpix_alola: return "Vulpix Alola"
    case .ninetales_alola: return "Ninetales Alola"
    case .diglett_alola: return "Diglett Alola"
    case .dugtrio_alola: return "Dugtrio Alola"
    case .meowth_alola: return "Meowth Alola"
    case .persian_alola: return "Persian Alola"
    case .geodude_alola: return "Geodude Alola"
    case .graveler_alola: return "Graveler Alola"
    case .golem_alola: return "Golem Alola"
    case .grimer_alola: return "Grimer Alola"
    case .muk_alola: return "Muk Alola"
    case .exeggutor_alola: return "Exeggutor Alola"
    case .marowak_alola: return "Marowak Alola"
    case .greninja_battle_bond: return "Greninja Battle Bond"
    case .greninja_ash: return "Greninja Ash"
    case .zygarde_10_power_construct: return "Zygarde 10 Power Construct"
    case .zygarde_50_power_construct: return "Zygarde 50 Power Construct"
    case .zygarde_complete: return "Zygarde Complete"
    case .gumshoos_totem: return "Gumshoos Totem"
    case .vikavolt_totem: return "Vikavolt Totem"
    case .oricorio_pom_pom: return "Oricorio Pom Pom"
    case .oricorio_pau: return "Oricorio Pau"
    case .oricorio_sensu: return "Oricorio Sensu"
    case .lycanroc_midnight: return "Lycanroc Midnight"
    case .wishiwashi_school: return "Wishiwashi School"
    case .lurantis_totem: return "Lurantis Totem"
    case .salazzle_totem: return "Salazzle Totem"
    case .minior_orange_meteor: return "Minior Orange Meteor"
    case .minior_yellow_meteor: return "Minior Yellow Meteor"
    case .minior_green_meteor: return "Minior Green Meteor"
    case .minior_blue_meteor: return "Minior Blue Meteor"
    case .minior_indigo_meteor: return "Minior Indigo Meteor"
    case .minior_violet_meteor: return "Minior Violet Meteor"
    case .minior_red: return "Minior Red"
    case .minior_orange: return "Minior Orange"
    case .minior_yellow: return "Minior Yellow"
    case .minior_green: return "Minior Green"
    case .minior_blue: return "Minior Blue"
    case .minior_indigo: return "Minior Indigo"
    case .minior_violet: return "Minior Violet"
    case .mimikyu_busted: return "Mimikyu Busted"
    case .mimikyu_totem_disguised: return "Mimikyu Totem Disguised"
    case .mimikyu_totem_busted: return "Mimikyu Totem Busted"
    case .kommo_o_totem: return "Kommo O Totem"
    case .magearna_original: return "Magearna Original"
    case .pikachu_partner_cap: return "Pikachu Partner Cap"
    case .marowak_totem: return "Marowak Totem"
    case .ribombee_totem: return "Ribombee Totem"
    case .rockruff_own_tempo: return "Rockruff Own Tempo"
    case .lycanroc_dusk: return "Lycanroc Dusk"
    case .araquanid_totem: return "Araquanid Totem"
    case .togedemaru_totem: return "Togedemaru Totem"
    case .necrozma_dusk: return "Necrozma Dusk"
    case .necrozma_dawn: return "Necrozma Dawn"
    case .necrozma_ultra: return "Necrozma Ultra"
    case .pikachu_starter: return "Pikachu Starter"
    case .eevee_starter: return "Eevee Starter"
    case .pikachu_world_cap: return "Pikachu World Cap"
    case .meowth_galar: return "Meowth Galar"
    case .ponyta_galar: return "Ponyta Galar"
    case .rapidash_galar: return "Rapidash Galar"
    case .slowpoke_galar: return "Slowpoke Galar"
    case .slowbro_galar: return "Slowbro Galar"
    case .farfetchd_galar: return "Farfetchd Galar"
    case .weezing_galar: return "Weezing Galar"
    case .mr_mime_galar: return "Mr Mime Galar"
    case .articuno_galar: return "Articuno Galar"
    case .zapdos_galar: return "Zapdos Galar"
    case .moltres_galar: return "Moltres Galar"
    case .slowking_galar: return "Slowking Galar"
    case .corsola_galar: return "Corsola Galar"
    case .zigzagoon_galar: return "Zigzagoon Galar"
    case .linoone_galar: return "Linoone Galar"
    case .darumaka_galar: return "Darumaka Galar"
    case .darmanitan_galar_standard: return "Darmanitan Galar Standard"
    case .darmanitan_galar_zen: return "Darmanitan Galar Zen"
    case .yamask_galar: return "Yamask Galar"
    case .stunfisk_galar: return "Stunfisk Galar"
    case .zygarde_10: return "Zygarde 10"
    case .cramorant_gulping: return "Cramorant Gulping"
    case .cramorant_gorging: return "Cramorant Gorging"
    case .toxtricity_low_key: return "Toxtricity Low Key"
    case .morpeko_hangry: return "Morpeko Hangry"
    case .zacian_crowned: return "Zacian Crowned"
    case .zamazenta_crowned: return "Zamazenta Crowned"
    case .eternatus_eternamax: return "Eternatus Eternamax"
    case .urshifu_rapid_strike: return "Urshifu Rapid Strike"
    case .zarude_dada: return "Zarude Dada"
    case .calyrex_ice: return "Calyrex Ice"
    case .calyrex_shadow: return "Calyrex Shadow"
    case .venusaur_gmax: return "Venusaur Gmax"
    case .charizard_gmax: return "Charizard Gmax"
    case .blastoise_gmax: return "Blastoise Gmax"
    case .butterfree_gmax: return "Butterfree Gmax"
    case .pikachu_gmax: return "Pikachu Gmax"
    case .meowth_gmax: return "Meowth Gmax"
    case .machamp_gmax: return "Machamp Gmax"
    case .gengar_gmax: return "Gengar Gmax"
    case .kingler_gmax: return "Kingler Gmax"
    case .lapras_gmax: return "Lapras Gmax"
    case .eevee_gmax: return "Eevee Gmax"
    case .snorlax_gmax: return "Snorlax Gmax"
    case .garbodor_gmax: return "Garbodor Gmax"
    case .melmetal_gmax: return "Melmetal Gmax"
    case .rillaboom_gmax: return "Rillaboom Gmax"
    case .cinderace_gmax: return "Cinderace Gmax"
    case .inteleon_gmax: return "Inteleon Gmax"
    case .corviknight_gmax: return "Corviknight Gmax"
    case .orbeetle_gmax: return "Orbeetle Gmax"
    case .drednaw_gmax: return "Drednaw Gmax"
    case .coalossal_gmax: return "Coalossal Gmax"
    case .flapple_gmax: return "Flapple Gmax"
    case .appletun_gmax: return "Appletun Gmax"
    case .sandaconda_gmax: return "Sandaconda Gmax"
    case .toxtricity_amped_gmax: return "Toxtricity Amped Gmax"
    case .centiskorch_gmax: return "Centiskorch Gmax"
    case .hatterene_gmax: return "Hatterene Gmax"
    case .grimmsnarl_gmax: return "Grimmsnarl Gmax"
    case .alcremie_gmax: return "Alcremie Gmax"
    case .copperajah_gmax: return "Copperajah Gmax"
    case .duraludon_gmax: return "Duraludon Gmax"
    case .urshifu_single_strike_gmax: return "Urshifu Single Strike Gmax"
    case .toxtricity_low_key_gmax: return "Toxtricity Low Key Gmax"
    case .growlithe_hisui: return "Growlithe Hisui"
    case .arcanine_hisui: return "Arcanine Hisui"
    case .voltorb_hisui: return "Voltorb Hisui"
    case .electrode_hisui: return "Electrode Hisui"
    case .typhlosion_hisui: return "Typhlosion Hisui"
    case .qwilfish_hisui: return "Qwilfish Hisui"
    case .sneasel_hisui: return "Sneasel Hisui"
    case .samurott_hisui: return "Samurott Hisui"
    case .lilligant_hisui: return "Lilligant Hisui"
    case .zorua_hisui: return "Zorua Hisui"
    case .zoroark_hisui: return "Zoroark Hisui"
    case .braviary_hisui: return "Braviary Hisui"
    case .sliggoo_hisui: return "Sliggoo Hisui"
    case .goodra_hisui: return "Goodra Hisui"
    case .avalugg_hisui: return "Avalugg Hisui"
    case .decidueye_hisui: return "Decidueye Hisui"
    case .dialga_origin: return "Dialga Origin"
    case .palkia_origin: return "Palkia Origin"
    case .basculin_white_striped: return "Basculin White Striped"
    case .basculegion_female: return "Basculegion Female"
    case .enamorus_therian: return "Enamorus Therian"
    case .tauros_paldea_combat_breed: return "Tauros Paldea Combat Breed"
    case .tauros_paldea_blaze_breed: return "Tauros Paldea Blaze Breed"
    case .tauros_paldea_aqua_breed: return "Tauros Paldea Aqua Breed"
    case .wooper_paldea: return "Wooper Paldea"
    case .oinkologne_female: return "Oinkologne Female"
    case .dudunsparce_three_segment: return "Dudunsparce Three Segment"
    case .palafin_hero: return "Palafin Hero"
    case .maushold_family_of_three: return "Maushold Family Of Three"
    case .tatsugiri_droopy: return "Tatsugiri Droopy"
    case .tatsugiri_stretchy: return "Tatsugiri Stretchy"
    case .squawkabilly_blue_plumage: return "Squawkabilly Blue Plumage"
    case .squawkabilly_yellow_plumage: return "Squawkabilly Yellow Plumage"
    case .squawkabilly_white_plumage: return "Squawkabilly White Plumage"
    case .gimmighoul_roaming: return "Gimmighoul Roaming"
    case .ursaluna_bloodmoon: return "Ursaluna Bloodmoon"
    case .ogerpon_wellspring_mask: return "Ogerpon Wellspring Mask"
    case .ogerpon_hearthflame_mask: return "Ogerpon Hearthflame Mask"
    case .ogerpon_cornerstone_mask: return "Ogerpon Cornerstone Mask"
    case .terapagos_terastal: return "Terapagos Terastal"
    }
  }
}
