-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Már 01. 09:55
-- Kiszolgáló verziója: 10.4.28-MariaDB
-- PHP verzió: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `webes_utazas_lg_tv`
--
CREATE DATABASE IF NOT EXISTS `webes_utazas_lg_tv` DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;
USE `webes_utazas_lg_tv`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `celok`
--

CREATE TABLE `celok` (
  `uticel_id` int(11) NOT NULL,
  `varos` varchar(255) NOT NULL,
  `orszag` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `celok`
--

INSERT INTO `celok` (`uticel_id`, `varos`, `orszag`) VALUES
(1, 'Debrecen\r\n', 'Magyarország'),
(2, 'Budapest', 'Magyarország'),
(3, 'Párizs', 'Franciaország'),
(4, 'Madrid', 'Spanyolország');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `erdekessegek`
--

CREATE TABLE `erdekessegek` (
  `erd_id` int(11) NOT NULL,
  `erd_szoveg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci NOT NULL,
  `varos_kep` varchar(255) NOT NULL,
  `varos_id` int(11) NOT NULL,
  `erd_nev` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `erdekessegek`
--

INSERT INTO `erdekessegek` (`erd_id`, `erd_szoveg`, `varos_kep`, `varos_id`, `erd_nev`) VALUES
(1, 'Termálfürdők: Budapest a világ egyik legnagyobb termálfürdőjének, a Gellért Fürdőnek és más híres fürdőinek otthona. Ezek a gyógyfürdők nemcsak a pihenés és szórakozás, hanem az egészségmegőrzés szempontjából is kiválóak.', '9607.jpg', 1, 'Termálfürdők'),
(2, 'A Budai Várnegyed (németül: Ofener Burgviertel) Budapest I. kerületének egyik városrésze Vár néven, Buda városának ősi területe. 1987 óta az UNESCO világörökség listáján Budai Várnegyed néven szerepel.[1] A Duna felett 70, a tengerszint felett pedig 175 méter magasan fekvő Várhegy fennsíkja történelmileg jó stratégiai pozíciónak számított. IV. Béla magyar király építtette meg itt a tatárjárás után erődjét, Hunyadi Mátyás pedig királyságának fővárosát.', 'buda.jpg', 1, 'Budai vár'),
(3, 'A Tirana piramis egy egyedi építészeti alkotás, amely a 20. század elején a kommunizmus emlékeként épült. Az évek során több célra is felhasználták, jelenleg pedig változatos kulturális események színhelye.', 'tirane.jpg', 2, 'Pyramid of Tirana'),
(4, 'A tér neve azoknak az embereknek állít emléket, akik életüket áldozták Albánia függetlenségéért. Itt található a Qemal Stafa Stadion is, amely Albánia legnagyobb sportkomplexuma.', 'tirane2.jpg', 2, 'Dëshmorët e Kombit tér (Nemzeti Mártírok tér)'),
(5, 'Az emigráció emlékműve Algír szívében található és azoknak az embereknek állít emléket, akik az algériai függetlenségi háború alatt menekültek külföldre. Az emlékmű szobrain és sírföldjén keresztül megörökíti az emigráció tragédiáját.', 'algir.jpg', 3, 'Az emigráció emlékműve'),
(6, 'Algír óvárosa, a Kasbah, az UNESCO Világörökség része. A keskeny utcácskákat, fehérre meszelt házakat és az Andalúz stílusú építészetet felfedezve olyan érzése támadhat, mintha az időben visszarepültél volna.', 'kasba.jpg', 3, 'Kasbah negyed'),
(7, 'Egy másik lenyűgöző palota Bécsben a Belvedere, amely a város központjától nem messze helyezkedik el. A palota és a hozzá tartozó kertek stílusosan ötvözik a barokk és a rococo elemeket.', 'becs2.jpg', 4, 'Belvedere Palota'),
(8, 'Az impozáns Schönbrunni Kastély Bécs egyik leglátogatottabb látnivalója. A hatalmas kertjeivel és a kastélyban található csodálatos termeivel az UNESCO Világörökség része.', 'becs.png', 4, 'Schönbrunni Kastély és Kert'),
(11, 'Az Atomium Brüsszel egyik legikonikusabb épülete, amely egy óriási, kivágott atomot szimbolizál. Az 1958-as Világkiállításra épült, és azóta turisták millióit vonzza, akik felmászhatnak a golyókba és élvezhetik a várost panorámaként.', 'atom.webp', 5, 'Atomium'),
(12, 'A Grand Place Brüsszel központi tere, amelyet a világ egyik legszebb terei között tartanak számon. A tér körül számos gyönyörű, középkori eredetű épület található, köztük a városháza.', 'grand.jpg', 5, 'Grand Place (Nagy tér)'),
(13, 'Ez az ortodox székesegyház Szófia szívét képezi, és lenyűgöző építészeti részleteivel, ikonosztázájával és freskóival vonzza a látogatókat. A templomot a város egyik legfontosabb vallási és kulturális szimbólumaként tartják számon.', 'szofia.jpeg', 6, 'Szófia Székesegyház (Szveta Nedelya)'),
(14, 'Szófia a Vitosha-hegység lábánál fekszik, így a városból csodálatos kilátás nyílik a hegyre. A Vitosha ideális kirándulóhely, télen pedig síelési lehetőséget kínál', 'vitosa.jpg', 6, 'Vitosha-hegység'),
(15, 'Az Ottawa folyó partján elterülő Parlament Hill a kanadai parlament székhelye. Az épületegyüttes impozáns és gyönyörűen megvilágítva a város egyik ikonikus látványossága, különösen a nyári esti időszakban.', 'par.webp', 7, 'Parlament Hill (Parlament-domb)'),
(16, 'Az Ottawa és Kingston között húzódó Rideau Csatorna télen egy szabadban hűtött korcsolyapályává alakul, amely a város életének fontos részét képezi. A csatornán sétálni vagy korcsolyázni egy felejthetetlen élmény.', 'ott.jpg', 7, 'Ottawa Csatorna (Rideau Csatorna)'),
(17, 'A Malecón a tengerparti sétány, ahol az emberek sétálnak, pihennek és élvezik a tenger látványát. Az itt található épületek, kávézók és a kilátás a karibi tengerre teszik különlegessé ezt a területet.', 'havana.jpg', 8, 'Malecón'),
(18, 'A Tropicana Club a világ egyik legrégebbi és leghíresebb cabaret klubja. Az itt zajló előadások telis-tele vannak zenével, táncdalokkal és ragyogó kosztümökkel, amelyek bemutatják a kubai zenei és táncos hagyományokat.', 'club.webp', 8, 'Tropicana Club'),
(19, 'Nicosia óvárosa számos történelmi látnivalót kínál, köztük múzeumokat, mecseteket és a régi várfalakat. A Ledra Street a város egyik leghíresebb bevásárlóutcája, ahol modern butikok és hagyományos üzletek is találhatók.', 'ovaros.jpg', 9, 'Óváros és Ledra Street'),
(20, 'A Szent János Katedrális a középkorban épült és a város egyik legrégebbi keresztény temploma. A katedrális kivételes művészeti és építészeti értékekkel büszkélkedhet.', 'nic.jpg\r\n', 9, 'Saint John Katedrális'),
(21, 'A Berlini Fal a hidegháború szimbóluma volt, amely 1961 és 1989 között választotta el Kelet- és Nyugat-Berlint. A fal maradványai és a hozzá kapcsolódó emlékhelyek, például a East Side Gallery, ma is megtekinthetők.', 'fal.jpg', 10, 'Berlini Fal'),
(22, 'Berlin egyik leghíresebb ikonja, a Brandenburgi Kapu a város történelmi központjában található. Az 18. századi neoklasszikus kapu ma is a béke és szabadság szimbóluma.', 'berlin.jpg', 10, 'Brandenburgi Kapu'),
(23, 'A Hallgrímskirkja Izland legnagyobb temploma és Reykjavík jellegzetes sziluettjének része. Modernista stílusával és lenyűgöző kilátásával a városra a torony tetejéről a templom egy kihagyhatatlan látnivaló.', 'izland.jpg', 11, 'Hallgrímskirkja Templom'),
(24, 'A Sólfar, vagy \"Napfényvitorla\" egy műalkotás Reykjavík tengerpartján. Az absztrakt fémből készült szobor a napfelkelte és a természet szépségeinek tiszteletére áll.', 'solfar.jpg', 11, 'Sólfar (Napfényvitorla)'),
(25, 'A Colosseum Róma egyik leghíresebb és legismertebb látnivalója. Ez az ókori amfiteátrum az ókori gladiátori harcok és különböző előadások színhelye volt. A Colosseum ma a város egyik jelképévé vált.', 'col.jpg', 12, 'Colosseum'),
(26, 'A Pantheon egy ókori templom, amelyet a rómaiak minden isten számára emeltek. Az épület impozáns kupolája és oltára miatt különleges.', 'pan.jpg', 12, 'Pantheon'),
(27, 'A Shibuya Átkelő a világ egyik legforgalmasabb átkelőhelye, ahol több ezer ember kel át egyszerre, amikor a lámpák zöldre váltanak. Ez egy ikonikus helyszín, amelyet gyakran látni a tokiói filmekben és posztereken.', 'shib.jpg', 13, 'Shibuya Átkelő (Shibuya Crossing)'),
(28, 'A Tokyo Tower a város egyik ikonikus látképi pontja, amely hasonlít az Eiffel-toronyra. A kilátóból lenyűgöző panoráma tárul eléd, és az épület különféle színekben világít éjszaka.', 'tok.jpg', 13, 'Tokiói Torony (Tokyo Tower)'),
(30, 'A Sultan Park egy kellemes közpark Malé központjában, ahol látogatók pihenhetnek, sétálhatnak, és élvezhetik a zöld környezetet.', 'sult.jpg', 14, 'Sultan Park'),
(31, 'Malé kis területű, így a város szűk utcái és sűrűn épült házai a sziget jellegzetes látványát alkotják. A tradicionális maldivi építészet itt is jelen van.', 'ut.jpg', 14, 'Szűk Utcák és Épületek'),
(32, 'A Millennium Híd egy modern híd, amely átíveli a Moraca folyót, és jellegzetes építészeti alkotás Podgoricában.', 'mil.webp', 15, 'Millennium Híd'),
(33, 'A városban található Szent György Templom egy ortodox templom, amely az 19. században épült, és jellegzetes orosz-orthodox stílusban készült.', 'pod.jpg', 15, 'Szent György Templom'),
(34, 'A Garden of Dreams egy gyönyörű, neoklasszikus kert, amely kiváló hely a pihenésre és a csendes séta során való elidőzésre.', 'gar.jpeg', 16, 'Garden of Dreams'),
(35, 'Ez a hindu templom a Bagmati folyó partján fekszik, és a világ egyik legjelentősebb hindu szent helye. A Pashupatinath templom különleges építészeti stílusával és vallási jelentőségével tűnik ki.', 'temp.jpg', 16, 'Pashupatinath Templom'),
(36, 'A Vigeland Park (Vigelandsanlegget) a világ legnagyobb szoborparkja, Gustav Vigeland norvég szobrász alkotásaival. A parkban több mint 200 szobor található, és az élet minden aspektusát bemutatja.', 'vig.jpg', 17, 'Vigeland Park'),
(37, 'Az Aker Brygge egy modern városrész, amely a kikötő mentén terül el. Sok étteremmel, üzlettel, és kulturális intézménnyel rendelkezik, és egy népszerű hely a helyiek és a turisták körében.', 'aka.jpg', 17, 'Aker Brygge'),
(38, 'Varsó Óvárosa az UNESCO Világörökség része, és lenyűgöző történelmi épületeket, kis utcákat és tereket kínál. Az Óváros helyreállítása a második világháború után a várost helyreállító törekvések része volt.', 'varso.jpg', 18, 'Óváros (Stare Miasto)'),
(39, 'A Varsói Felkelés Múzeum (Muzeum Powstania Warszawskiego) bemutatja a város 1944-es felkelését és a várost ért szenvedéseket a második világháború idején.', 'muz.jpg', 18, 'Varsói Felkelés Múzeum'),
(40, 'A Pasteis de Nata, azaz a tejespite, egy híres portugál édesség. A város Belém negyedében található Pasteis de Belém kávézóban a hagyományos recept alapján készülő édesség a legfinomabb.', 'suti.jpg', 19, 'Belém Pasteis de Nata'),
(41, 'A Béke és Szabadság Szobor egy hatalmas szobor, amely a Tejo folyó túloldalán, Almada városában található. A szoborból lenyűgöző kilátás nyílik Lisszabonra.', 'szob.jpg', 19, 'Béke és Szabadság Szobor (Cristo Rei)'),
(42, 'A múzeum 2019-ben nyitotta meg kapuit, és bemutatja Katar gazdag történelmét, kultúráját és örökségét. Az épületet Jean Nouvel tervezte, és a tengeri kultúrát idéző formája kiemelkedő.', 'qatar.jpg', 20, 'Katar Nemzeti Múzeum'),
(43, 'Ez a hagyományos piac Doha egyik legrégebbi részén található. A piacot 2006-ban renoválták, de a hagyományos arab stílus megőrzésére törekedtek. A Souq Waqif-ban kereskednek fűszerekkel, ékszerekkel, textíliákkal és más helyi termékekkel.', 'doha.jpg', 20, 'Souq Waqif'),
(44, 'Ez a hatalmas épület a világ legnagyobb parlamentépülete, és Nicolae Ceaușescu román diktátor rendelte el az építését. Az épület mérete és pompája lenyűgöző, és a turisták gyakran látogatják.', 'buk.jpg', 21, 'Parlament Palota'),
(45, 'A város egyik legnagyobb parkja, amely egy mesterséges tóval és számos sétányjal rendelkezik. A parkot kikötőként használják, ahol csónakok és kajakok bérelhetők.', 'park.jpg', 21, 'Herastrau Park'),
(46, 'A Vörös tér Oroszország leghíresebb tere, melyet a Kreml erőd, az Lenin-mauzóleum és a Baszilikával, valamint a Gum bevásárlóközponttal határolnak. Ez a tér jelképezi Oroszország történelmét és hatalmát.', 'voros.jpg', 22, 'Vörös tér'),
(47, 'Az egyetem egyike Európa és Ázsia legrégebbi és leghíresebb egyetemeinek. Az épületegyüttes a Sparrow Hills dombján található, és gyönyörű kilátást nyújt a városra.', 'lom.jpg', 22, 'Lomonoszov Egyetem '),
(48, 'A város központjában található erőd a Duna és a Száva folyók találkozásánál emelkedik ki. A Kalemegdan területe történelmi emlékekkel, parkokkal és kilátópontokkal van tele, és gyakran szolgál kulturális rendezvények helyszínéül.', 'erod.jpg', 23, 'Kalemegdan erőd'),
(49, 'Ez a bohém negyed híres az utcájáról, ahol számos étterem, kávézó és művészeti galéria található. Skadarlija a belgrádi bohém élet központja, ahol élvezheted a hagyományos szerb konyhát és a szórakozást.', 'bel.webp', 23, 'Skadarlija'),
(50, 'A pozsonyi Roland-szobor a város főterén, a Hlavné námestie-n található. A szobor egy középkori védőszentet ábrázol, és a város szabadságának szimbóluma.', 'brem.jpg', 24, 'Roland-szobor'),
(51, 'A Primaciális Palota a városközpontban található és a pozsonyi érsek otthona volt. Az épületet neogótikus stílusban tervezték, és a Bratislava-nyilatkozat aláírásának helyszíne is volt.', 'pal.jpg', 24, 'Primaciális Palota'),
(52, 'A várat a város magaslatán, egy dombon találod. A kilátóból csodálatos panoráma tárul eléd a városra és a környező hegyekre.', 'var.jpg', 25, 'Ljubljana Vára'),
(53, 'A Nemzeti Múzeum Szlovénia történelmét és kultúráját mutatja be. A múzeum épülete a városközpontban található, a Tivoli Park közelében.', 'muze.jpg', 25, 'Narodni Muzej'),
(54, 'Az El Prado Spanyolország legjelentősebb művészeti múzeuma, ahol egyedülálló gyűjteményt találhatsz olyan festményekből, mint Velázquez, Goya és El Greco alkotásai.', 'mad.webp', 26, 'El Prado Múzeum'),
(55, 'Ha érdeklik a sport, látogasd meg a Real Madrid futballcsapatának otthonát. A stadion túrákon részt vehetsz, és megismerheted a klub történelmét és a stadion kulisszatitkait.', 'real.jpg', 26, 'Santiago Bernabéu Stadion'),
(56, 'Ez az emlékhely és mauzóleum a modern Törökország alapítója, Mustafa Kemal Atatürk sírjának helye. Az Anıtkabir szimbolizálja a török nemzeti egységet és függetlenséget.', 'anti.jpg', 27, 'Anıtkabir'),
(57, 'A múzeum a török néprajzi és etnográfiai hagyományokat mutatja be, többek között viseletek, hagyományos eszközök és lakóházak révén.', 'tor.jpg', 27, 'Ankara Etnográfiai Múzeum'),
(58, 'Ez az etnográfiailag rekonstruált falu az ukrán népi hagyományokat és életmódot mutatja be, és számos kézműves műhelyt is tartalmaz.', 'mam.webp', 28, 'Mamajeva Sloboda'),
(59, 'A Szófia Katedrális a város egyik legfontosabb vallási épülete, amely a 11. században épült. A katedrális a Szófia tér szívében található és a Kijev-Pecerszka Lavra része.', 'szof.webp', 28, 'Szófia Katedrális'),
(60, 'A Hoan Kiem-tó Hanoi szívében található, és gyakran az egyik legnépszerűbb találkozási pont a városban. A tó körül sétálva megcsodálhatod a Tóról elnevezett Ngoc Son-templomot is.', 'to.jpg', 29, 'Hoan Kiem-tó'),
(61, 'A Ho Chi Minh Mausoleum a város egyik ikonikus látnivalója, ahol a vietnámi forradalom vezére, Ho Chi Minh földi maradványai találhatók.', 'ho.jpg', 29, 'Ho Chi Minh Mausoleum');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `film`
--

CREATE TABLE `film` (
  `film_id` int(11) NOT NULL,
  `film_cim` varchar(50) NOT NULL,
  `film_datum` date NOT NULL,
  `film_hossz` int(11) NOT NULL,
  `film_kep` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `film`
--

INSERT INTO `film` (`film_id`, `film_cim`, `film_datum`, `film_hossz`, `film_kep`) VALUES
(1, 'Wandavision', '0000-00-00', 0, '1.png'),
(2, 'Loki', '0000-00-00', 0, '2.png'),
(3, 'Falcon and the winter soldier', '0000-00-00', 0, '3.png');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `nevezetessegek`
--

CREATE TABLE `nevezetessegek` (
  `Nevezetesseg_id` int(11) NOT NULL,
  `Nevezetesseg_nev` varchar(255) NOT NULL,
  `Nevezetesseg_szoveg` text NOT NULL,
  `Nevezetesseg_kep` varchar(255) NOT NULL,
  `Nevezetesseg_video` varchar(255) NOT NULL,
  `Orszag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `nevezetessegek`
--

INSERT INTO `nevezetessegek` (`Nevezetesseg_id`, `Nevezetesseg_nev`, `Nevezetesseg_szoveg`, `Nevezetesseg_kep`, `Nevezetesseg_video`, `Orszag_id`) VALUES
(1, 'Albán alpok', 'Albánia északi részét több, mint 2000 méteres hegyek, völgyekben csordogáló patakok és érintetlen természet teszi lemásolhatatlanná. Az Albán Alpok számos kincset rejt, mint a képen látható Theth, a Valbona-hágó vagy a Jezerca-hegy. Aki Albániában jár, nem hagyhatja ki ezt a gyönyörű vidéket!', 'albanalpok.jpg', 'https://www.youtube.com/embed/5cvxmbxVCJw?si=gCVY2pwIV6UBjpl1', 1),
(2, 'Kruja', 'Kruja egy történelmi város Tiranától nem messze, ami Szkender bég központja volt, továbbá ez volt Albánia fővárosa korábban. Kruja városát történelmi jelentősége és festői fekvése miatt sok turista keresi fel. A városka történeti emlékei a szinte teljes hosszában bejárható középkori várfalmaradványok és a 20. században felújított citadella, valamint a 19. századi, szűk sikátoros bazár.', 'kruja.jpg', 'https://www.youtube.com/embed/bmhb3KmyByw?si=82-ZOu37i47EVwhi', 1),
(3, 'Brutrint Nemzeti Park', 'A Butrint Nemzeti Park 1992 óta az UNESCO-Világörökség része archeológiai emlékei miatt, mely az egyik legfontosabb történelmi látnivaló Albániában. Az ország déli részén található kincs emellett csodálatos természettel is rendelkezik. Itt található Ksamil is, mely kristálytiszta vizével vonzza a turistákat.', 'butrinnp.jpg\r\n', 'https://www.youtube.com/embed/T4NN0PhKq78?si=wG4JE88lyt60R3_A', 1),
(4, 'Saranda', 'Saranda Albánia déli részén található 40 ezres város, amit luxus Albániának is hívnak strandjai és szállodai miatt. Ez Albánia egyik legszebb tengerparti része – a domboldalra legyezőszerűen felkapaszkodó házikók, apró csónakok sokasága a kék tengeren. A város mellett található hipnotikus erejű tó, a Kék Szem Forrás (Syri i Kalter) a nevét onnan kapta, hogy partjának kék, éles szegélyei a szem íriszére emlékeztetnek.', 'saranda.jpg', 'https://www.youtube.com/embed/XKC75JZp1-M?si=nOBFyc8TBDVk0Dsd', 1),
(5, 'Durres', 'Durres Albánia középső részén található az Adriai-tenger partján, nem messze a fővárostól, Tiranától. A város híres a képen látható bástyájáról, tengerpartjáról és kikötőjéről. Emellett  Durrës legnagyobb látványossága az i. sz. 2. századra datálható római kori amfiteátrum.', 'durres.jpg', 'https://www.youtube.com/embed/Cmxe9lU8B9g?si=Hv2MNC-JH0Y5cSMR', 1),
(6, 'Beni Hammád erődje', 'Beni Hammád erődje, hivatalos megnevezéssel Beni Hammád-i el-Kala (arabul قلعة بني حماد, jelentése ’Hammád fiainak erődje’; a név elemeinek egyéb átírásváltozatai: Beni Hammad, Al Qal’a, Al Qal’ah, Qalaa, Kalaa) Algéria 1980 óta világörökségi védelmet élvező középkori romvárosa, a hammádida emírek 1007 és 1090 közötti erődített fővárosának romjai Algírtól 225 kilométerre délkeletre, Mszila tartomány hegyvidéki területein, a Hodna-hegységben. Az 1000 méteres tengerszint feletti magasságban lévő emlékhely az arabok és az iszlám történelmének egyik legmonumentálisabb építészeti együttese.', 'benihammand.jpg', 'https://www.youtube.com/embed/po0dcvH2Fm4?si=IrbW2UseNZvpXb8g', 2),
(7, 'Djurdjura Nemzetközi Park', 'Ez az algériai park Észak-Algériában is található, néhány mérföldre a parttól. A Djurdjura-hegység jelentős látnivaló a parkban, amelyről a park nevét kapta. 82,5 négyzetkilométernyi területet foglal el és becslések szerint 1983 júliusában hozták létre. Délen a park Bouira tartományba, északról pedig Tizi Ouiziuba húzódik.', 'djurdjura,jpg', 'https://www.youtube.com/embed/3-Dts2-Omnc?si=kUrD0locGGYpLw_K', 2),
(8, 'Tahat', 'Tahat, 2908 méterrel Algéria legmagasabb pontja. Az Ahaggar-hegységben, az ország déli részén található Tamanrasettől 56 km-re délre. Ez a vulkán-hegység az Ahaggar-hegység legmagasabb pontja.\r\n', 'tahat.jpg\r\n', '', 2),
(9, 'Jijel', 'Jijel ( arabul : ولاية جيجل ) egy tartomány ( wilaya ) Algériában , a Földközi-tenger keleti partján. Fővárosa Jijel (föníciai név: Igilgili ). A Taza Nemzeti Park ebben a tartományban található.', 'jijel.jpg', 'https://www.youtube.com/embed/fNHt86sWxWE?si=Op0kc6bPTt1N0uU8', 2),
(10, 'Bécsi Operaház (Wiener Staatsoper)', 'A bécsi operaház az egyik legjelentősebb operaház a világon és Ausztria kulturális életének fontos része. A szecessziós stílusú épület 1869-ben épült, és az opera és a balett kiemelkedő helyszíne.', 'becsioperahaz.jpg', 'https://www.youtube.com/embed/VEeYCe0Doj8?si=vaD5jIGsCSilL0bB\r\n', 3),
(11, 'Schönbrunni Kastély és Park', 'A bécsi Schönbrunn kastély és a hozzá tartozó kertek az UNESCO Világörökség részei. A Habsburg család nyári rezidenciájaként szolgált, és a barokk stílusú kastély és a csodálatos kertek ma is népszerű turisztikai látványosságok.', 'Schönbrunni_Kastély_és_Park.jpg', 'https://www.youtube.com/embed/jm9C_t04BFQ?si=4xPg4uT6SxKzbTjh', 3),
(12, 'Hofburg Palota', 'Bécs történelmi központjában található a Hofburg Palota, amely a Habsburg Birodalom egykori székhelye volt. A palota ma múzeumoknak, galériáknak és az osztrák elnök hivatalának ad helyet.', 'Hofburg_Palota.jpg', 'https://www.youtube.com/embed/0oTPFUIKpNM?si=cTdGPhDvyXTChR64', 3),
(13, 'Hallstatti-tó', 'Az Ausztriai Alpok egyik gyöngyszeme a Hallstatti-tó. A Hallstatt nevű festői kisváros a tó partján fekszik, és az idillikus környezetével, a hegyekkel és a tóval lenyűgöző látványt nyújt.', 'Hallastatti-tó.jpg', 'https://www.youtube.com/embed/f12IcpbNs_Q?si=mEExhmF0lAMV0Nbj', 3),
(14, 'Innsbrucki Aranyteto', 'Az Innsbrucki Aranyteto egy híres sí- és hegymászó régió az osztrák Alpokban. A várost lenyűgöző környezet veszi körül, és az aranyfedésű tető, a \"Goldenes Dachl\", az egyik jellegzetes épülete a városnak, amely a 15. században épült.', 'Innsbrucki_Aranyteto.jpg', 'https://www.youtube.com/embed/Ug-ZVK9LAe8?si=42NbIO3K1i203Bir', 3),
(15, 'Grand Place (Grote Markt)', 'A Grand Place Brüsszel történelmi központjának egyik legfontosabb területe. A teret lenyűgöző, gazdagon díszített épületek veszik körül, köztük a városháza. A Grand Place az UNESCO Világörökség része.', 'Grand_Place.jpg', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/We4HubHTCT4?si=Tvg6j_KLyIpQpinj\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" a', 4),
(16, 'Brugge óváros', 'Brugge egy káprázatosan szép belga város, amely híres középkori építészeti örökségéről és csatornáiról. A város óvárosa is az UNESCO Világörökség része, és az itteni történelmi helyek közé tartozik a Béguinage, a Szent Vaszilisz-templom és a Belfort torony.', 'Brugge_óváros.jpg', 'https://www.youtube.com/embed/E7pt2Zwg79g?si=wV9uTCYM7ancsm0U', 4),
(17, 'Atomium', 'Az Atomium egy ikonikus épület és múzeum Brüsszel északi részén. A modernista épület a 1958-as Expo világkiállításra épült, és egy óriási vas-molekulát ábrázol, amely 165 milliószorosítja egy valóságos vasatom szerkezetét.', 'Atomium.jpg', 'https://www.youtube.com/embed/SLK5yVXm4aQ?si=5IGieagRCMcG83R2', 4),
(18, 'Tournai Katedrális', 'A Tournai Katedrális Belgium legrégebbi katedrálisa és az UNESCO Világörökség része. A román stílusú katedrálisban számos művészeti kincs található, és a középkori építészet remeke.', 'Tournai_Katedrális.jpg', 'https://www.youtube.com/embed/HU2wOLm3C6s?si=JpZRgS3ikwmvE3_C', 4),
(19, 'Antwerpeni Diamántnegyed', 'Antwerpen híres a gyémántkereskedelméről, és a Diamántnegyed a városban található gyémántkereskedők és ékszerüzletek központja. Azok, akik érdeklődnek a drágakövek iránt, élvezhetik a gyémántvágó műhelyek és ékszerüzletek látogatását a negyedben.', 'Antwerpeni_Diamántnegyed.jpg', 'https://www.youtube.com/embed/HPFSMNLmfZk?si=ZoD-S7im7e9xL3Bv', 4),
(20, 'Rila Kolostor', 'Az UNESCO Világörökség részeként számon tartott Rila Kolostor Bulgária legnagyobb és legrégebbi kolostora. A Rila-hegységben található, és a 10. században alapították. A kolostor jelentős művészeti és történelmi kincseket őriz, beleértve a híres freskóit is.', 'Rila_Kolostor.jpg', 'https://www.youtube.com/embed/TjkYON0fjNs?si=Oaf1sAKET1xYkekz', 5),
(21, 'Nesebar', 'A Fekete-tenger partján található Nesebar egy gyönyörű tengerparti város, amely gazdag történelemmel rendelkezik. Az óvárosa szintén az UNESCO Világörökség része, és a középkori építészeti stílusok, a szűk utcák és a tengeri panoráma miatt népszerű turisztikai célpont.', 'Nesebar.jpg', 'https://www.youtube.com/embed/MJFx7R4IgLY?si=g1ge1iGWoRWwYsCl', 5),
(22, 'Várnai Óváros', 'Várnában található az óváros, amely a Fekete-tenger partján fekszik. A város gazdag történelemmel rendelkezik, és az óvárosban számos műemlék, köztük a Várnai római fürdők és a Várnai ókeresztény bazilika található.', 'Várnai_Óváros.jpg', 'https://www.youtube.com/embed/iy4qHXB9BtQ?si=Mhqve4u-hqv2erJ3', 5),
(23, 'Pirin Nemzeti Park', 'Bulgária déli részén fekvő Pirin Nemzeti Park a UNESCO Világörökség része, és a Pirin-hegységben található. A park lenyűgöző tájakkal rendelkezik, amelyek magukban foglalják a hegyeket, gleccsereket, erdőket és tókat. A parkban számos ritka növény- és állatfaj található.', 'Pirin_Nemzeti_Park.jpg', 'https://www.youtube.com/embed/x5j8Hd1bHQI?si=AwJZyJh3cQfyxUOe', 5),
(24, 'Veliko Tarnovo', 'Veliko Tarnovo egy történelmi város a Balkán-fennsíkon, amely egykor a második bolgár birodalom fővárosa volt. A város nevezetes a középkori erődjeiről, a szűk utcáiról és a Tzarevetz erődítményéről, amely magaslatról gyönyörű kilátást nyújt a környező vidékre.\r\n\r\n\r\n\r\n\r\n\r\n', 'Veliko_Tarnovo.jpg', 'https://www.youtube.com/embed/dFqYXAwSyrk?si=y2w6v8eCMN6n1URh', 5),
(25, 'Banff Nemzeti Park', 'Lenyűgöző tájak, hegyek és tók jellemzik ezt a nemzeti parkot Alberta tartományban.', 'Banff_Nemzeti_Park.jpg', 'https://www.youtube.com/embed/MWbChvv2rKU?si=iv1s94ZMixcihQp9', 6),
(26, 'Niagara-vízesés', 'A világ legismertebb vízesése, amely Ontario és New York között helyezkedik el.', 'Niagara-vízesés.jpg', 'https://www.youtube.com/embed/_hZRG5gytIw?si=JlMbQ8sUYw6S-o3C', 6),
(27, 'CN Torony', 'Toronto ikonikus felhőkarcolója, amelyből gyönyörű kilátás nyílik a városra.', 'CN_Torony.jpg', 'https://www.youtube.com/embed/fgbFdV7yL_o?si=eJm6EQ1xRNMk6YV9', 6),
(28, 'Vancouver Stanley Park', 'A Csendes-óceán partján található, csodálatos park területtel és számos szórakoztató lehetőséggel.', 'Vancouver_Stanley_Park.jpg', 'https://www.youtube.com/embed/YfjX4ySiVh4?si=3aKcuxSV-sP8qJkl', 6),
(29, 'Québec város', 'Az egyik legrégebbi város Észak-Amerikában, amely történelmi hangulatával és európai stílusú épületeivel hívja fel magára a figyelmet.', 'Québec_város.jpg', 'https://www.youtube.com/embed/ri8x8jqnLUs?si=CSKLG4_yUI7ZdhHE', 6),
(30, 'Havanna óváros', 'Az UNESCO Világörökség része, tele van történelmi épületekkel és szűk utcákkal.', 'Havanna_óváros.jpg', 'https://www.youtube.com/embed/VSH-o2cbW9A?si=hWkeM9XJ4nWRg7Hq', 7),
(31, 'Viñales-völgy', 'Egy gyönyörű természeti terület, híres a karsztos hegyekről és a dohányültetvényekről.', 'Viñales-völgy.jpg', 'https://www.youtube.com/embed/zAtDKfv9pso?si=JmjQ08v-vvIKogR8', 7),
(33, 'Hogyha', '', 'photo_1706872188857_photo.jpg', '', 1),
(34, 'valami324', 'sdfafa', 'fasd', 'sdfasf', 0);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `nevjegy`
--

CREATE TABLE `nevjegy` (
  `Nevjegy_id` int(11) NOT NULL,
  `Nevjegy_nev` varchar(255) NOT NULL,
  `Nevjegy_datum` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `nevjegy`
--

INSERT INTO `nevjegy` (`Nevjegy_id`, `Nevjegy_nev`, `Nevjegy_datum`) VALUES
(1, ' László Gábor', '2024-01-03'),
(2, 'Tóth Viktor', '2024-01-03');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `orszag`
--

CREATE TABLE `orszag` (
  `Orszag_id` int(11) NOT NULL,
  `Orszag_nev` varchar(255) NOT NULL,
  `Orszag_zaszlo` varchar(255) NOT NULL,
  `Orszag_szoveg` text NOT NULL,
  `Orszag_link` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `orszag`
--

INSERT INTO `orszag` (`Orszag_id`, `Orszag_nev`, `Orszag_zaszlo`, `Orszag_szoveg`, `Orszag_link`) VALUES
(1, 'Albánia', 'Albania.gif', 'Albánia túlnyomórészt hegyevidékből áll. A tengerparti síkság hirtelen vált át hegyvonulattá, amely észak-nyugatról dél-keletre húzódik. Albánia hegységei két hegyvonulathoz tartoznak, az északi rész a Dínári Alpokhoz, a déli pedig a Pindushoz tartozik, amely aztán Görögországban folytatódik. Az ország legmagasabb hegysége a Korab, mely 2764 méter magas', 'https://www.youtube.com/embed/rd75KDJgQbE?si=Kd4HNPCkWHtKeEgP'),
(2, 'Algéria', 'Algeria.gif', 'Algéria a Földközi-tenger partján terül el. Északon a tengerpart mellett húzódik az Atlasz-hegység, délre haladva a terület túlnyomó részét sivatagok borítják. Az időjárás északon szubtrópusi földközi-tengeri, délen száraz szubtrópusi és trópusi. Ennek megfelelő a növényzet, melyet a déli területeken csupán oázisokban találunk.\r\n\r\nAz 1992-es választásokon győzött az iszlám szélsőséges párt, a választásokat azonban nem ismerték el és a hatalomra a katonai kormány lépett.', 'https://www.youtube.com/embed/XA2YX7ogTqQ?si=1iRgquyng-_y1uw3'),
(3, 'Ausztria', 'Austria.gif', 'Ausztria a magyar turisták által 7 leglátogatottabb ország közé tartozik. Ausztria, Magyarország nyugati szomszédja magas alpesi csúcsokkal, romatikus völgyekkel és romantikus városokkal, ideális szabadságunk eltöltéséhez. Az Ausztria szó alatt sokan elképzelnek egy alpesi országot gyönyörű városokkal, mint Bécs vagy Salzburg németül beszélő emberekkel, a kertészeknek képzeletükben megjelennek az alpesi muskátlik és a történelmet kedvelőknek az a tény hogy 1918-ig az Osztrák-Magyar Monarchiának Magyarország része volt.', 'https://www.youtube.com/embed/ejgpomz8eUs?si=6lSQp8l4_aK9u4nG'),
(4, 'Belgium', 'Belgium.gif', 'A Belga Királyság az Északi-tenger partjának kicsi állama.\r\n\r\nSokak számára csupán Brüsszelt és az Európai Uniót jelenti, az ország azonban ennél sokkal sokrétűbb. A főváros, Brüsszel természetesen csalogatja az ideérkezőt műemlékeivel, galéráival, nyüzsgő életével és a királyi családdal. A kilenc belga provincia emellett a sportolók és azok számára biztosít kiváló üdülőhelyet, akik a történelem, a művészet és a hagyományok iránt érdeklődnek, vagy csupán szórakozni szeretnének.', 'https://www.youtube.com/embed/NQN6XHheMDs?si=apY7j8gOqx91g5Wx'),
(5, 'Bulgária', 'Bulgaria.gif', 'Bulgáriának 7,5 millió lakosa van. A lakosság nagy része a fővárosban, Szófiában lakik. Hivatalos nyelv a bolgár nyelv, amely azonban a környező nyelvek hatása miatt jócskán eltávolodott a szláv típusú nyelvtől. A világnyelvekkel nehezebben, viszont oroszul annál könnyebben megérteti itt magát az ember. A vallási megoszlásban a pravoszlávok dominálnak. A bolgárok nagyon temperamentumosak és vendégszeretőek, mindenféle esemény alkalmából virágokkal ajándékozzák meg a másikat, és még az ismeretlen emberek körében is elterjedt a tegeződés. A bolgár kommunikációban speciális a bólintás, mint az egyet nem értés jele, és a fejcsóválás, mint az egyetértés kifejezése. Sokszor próbálnak alkalmazkodni a bolgárok a külföldiek szokásaihoz, és sokszor használják ezeket a gesztusokat fordított értelemben, mint ahogy az Bulgáriában megszokott - könnyen létrejöhet a félreértés. Bulgáriába való utazásunkor nem kell félni semmilyen különösebb rizikótól. Azokon a helyeken, ahol koncentráltábban fordulnak elő emberek, fokozottan kell vigyázni a zsebtolvajokra, azonban ez nem csak Bulgáriára érvényes. Turistáknak szintén nem ajánlott, hogy egyedül menjenek távolabbi helyekre.', 'https://www.youtube.com/embed/oisFeVdpdKU?si=E7wcYOV-nDKK-E-a'),
(6, 'Kanada', 'Canada.gif', 'Kanada a juharlevél országa. Partjait keleten az Atlanti-óceán nyugaton a Csendes-óceán hullámai mossák. Az ország déli területeinek földrajzi szélessége a rómaiéval megeggyezik, míg északi térségei a sarki jégmezőkbe nyúlnak. Kanadát hatalmas sziklás hegycsúcsok, végtelen erdők és prérik, a Yukon vadonja, az esőerdői és a fjordokkal tagolt tengerpartja jellemzi. Lakosainak száma 28.5 millió, melynek 90%-a az USA-val határos területen, mintegy 160 km-es sávban lakik. Hasonlóan, mint az USA-ban a kanadai lakosságot is bevándorlók alkotják, számos nemzet és a helyi őslakos indián kultúra keveredik itt. A brit és a francia nagy többség mellett laknak itt kiseb csoportokban kínaiak, ukránok, lengyelek, görögök és spanyolok. Egy bennük azonban közös, a tolarancia mellett mindannyian őrzik a saját kultúrájuk jegyeit és felettébb tisztelik a földet, melyben laknak.', 'https://www.youtube.com/embed/ArR-ctuKraE?si=PUpZYof3Ez_bMKI-'),
(7, 'Kuba', 'Cuba.gif', 'A Karib-tenger szívében fekszik, ott ahol a legszebb strandok és üdülőhelyek, a legjobb szivarok kaphatóak és mindemellett gazdag történelemmel rendelkezik. Egy olyan sziget, melynek lakói csak most kezdenek megismerkedni a környező világ szépségeivel. Kuba életteli, lüktető turistaparadicsom, a temperamentumos latin ritmus , a rum és az érzéki nők hazája, a kontrasztok és a színe földje. Aki nem ismeri Kubát és szépségeit, mintha sosem járt volna Közép-Amerikában. Fedezzük fel ezt a csodálatos országot! Íme az ország rövid jellemzése.\r\n', 'https://www.youtube.com/embed/uz6fhEMbpUo?si=KIkLpnT1U-L7TuPK'),
(8, 'Cyprus', 'Cyprus.gif', 'Ciprus, amelyet Aphrodité szigetének, valamint a szerelem szigetének neveznek, a Földközi-tenger harmadik legnagyobb szigete, mintegy tízezer négyzetkilométeren terül el. Itt járva még a legigényesebb turistának sincs oka panaszra. A homokos tengerpart és a szikrázó napsütés korántsem az egyetlen dolog, amiben gyönyörködhetünk.\r\n\r\nA sziget egykor egységes egészet alkotott, jelenleg azonban két részre osztódik, merőben különböző hagyományokkal és előírásokkal.\r\n', 'https://www.youtube.com/embed/Yfxem09g2rQ?si=MoSEhpl9FAWpJeCj'),
(9, 'Németország', 'Germany.gif', 'Németország, vagy hivatalos nevén a Németországi Szövetségi Köztársaság, egy független szövetségi állam Közép- és Nyugat-Európában. Területe az Alpoktól az Északi- és a Balti-tengerig terjed.', 'https://www.youtube.com/embed/K0uAIFbuPm8?si=ftXVFURsFhO_9lVQ'),
(10, 'Magyarország', 'Hungary.gif', 'Magyarország Európa szívében a Kárpát-medencében fekszik. Az ezerarcú Magyarország mindenki számára megfelelő lehetőséget kínál a kikapcsolódásra és szórakozásra. Az országot színes tájak, sokrétű domborzat, kellemes éghajlat jellemzi, másrészt megtalálhatók itt kongresszusi, üzleti és tudományos központok.\r\n', 'https://www.youtube.com/embed/ODbfYLLTukg?si=GfDlO8HskzzC4on_'),
(11, 'Izland', 'Iceland.gif', 'Az Izland köztársaság az Atlanti óceán északi részén található Izland nevű szigeten terül el. Az északi partvidéke nagyon tagolt, főként fjordok váltakozása jellemzi ezt a térséget. A sziget domborzatát vulkanikus hegységek és fennsíkok alkotják. Mind a mai napig működő vulkánok és források gazdagítják a természeti képet. A sziget 10 százalékát jégtakaró borítja, számos kisebb-nagyobb tóval tarkítva. A felszínen nincs gazdag flóra se fauna, csak ritkán találunk tisztást vagy kisebb erdős részt. Az éghajlat viszonylag mérsékelt, óceáni. Az ország gazdaságilag fejlett, jelentős a halászata és híres a fejlett infrastruktúrájáról.\r\n', 'https://www.youtube.com/embed/AVHozwCteL4?si=4v6zIelDK93UzMi8'),
(12, 'Olaszország', 'Italy.gif', 'Olaszország a temperamentumos olaszok földje. Az országot övező tenger felől kellemes szellő fúj. A partszakasz mintegy 1300 km-es övezetben húzódik észak-déli irányban, sok lehetőséget kínálva a kirándulásra és a történelmi műemlékek felkeresésére. Az ország határai csizma alakban rajzolódnak ki, mintha azt jeleznének, hogy Olaszország volt a támasza az európai civilizációk fejlődésének. A monumentalitás lenyűgöző, akár az olasz Dolomitokban, akár az Alpokban (amely természetes határt alkot Franciaország, Svájc, Szlovénia és Ausztria között), vagy az Appenini - hegységben járva, amelyről a félsziget elnevezése is származik.Említésre méltó város Róma, a reneszánsz Florencia, a romantikus Velence, vagy a Vezúv lábánál fekvő Nápoly. Relaxációhoz alkalmas helynek ígérkezik Bibione és Rimini. A Gargano-félszigeten nyugalmat és vad partszakaszokat találunk. Ne feledkezzünk meg Szardíniáról sem, melynek partjait azúrkék tenger határolja.', 'https://www.youtube.com/embed/2b2gJu-g3qE?si=K0opClO88tacO-5g'),
(13, 'Japán', 'Japan.gif', 'Az ország sok olyat tud nyújtani, amelyet más ország aligha. Az egyik oldalon itt vannak a gazdag történelmi háttérrel és építészeti különlegességekkel rendelkező buddhista templomaik, másrészt viszont a modern nagyvárosoknak,a technika csodáinak, mint a gyorsvonatok vagy a számítástechnikának a hazája. Hol máshol tapasztalhatnánk meg a csendes, harmonikus japán kertek és a rohanó, nyüzsgő Tókió hatalmas kontrasztját?', 'https://www.youtube.com/embed/G5RpJwCJDqc?si=0_HkXBlx77d4tN_b'),
(14, 'Maldív-szigetek', 'Maldives.gif', 'A Maldív-szigetek, pontosabban a Maldív Köztársaság Ázsia déli partjainál az Indiai-óceánban fekszik, legközelebbi szomszédai India és Srí Lanka. A szigetcsoportot 19 korallzátony, atoll alkotja. Minden atollt egy gyűrű alakú korallzátony alkot. Az atollon belül található a lagúna, amely több ezer tengeri állatfajnak ad otthont.', 'https://www.youtube.com/embed/rSgzrSyQZc0?si=ZptPkhRR2hTMocRM'),
(15, 'Montenegró', 'Montenegro.gif', 'Montenegró ( Crna Gora) Európa legfiatalabb állama, 2006. június 3-án alakult. Bár kevésbé ismert, attraktív helynek számít, ahol az idegenforgalom még nem igazán fejlett. Itt az idő, hogy megismerjünk valami újat, ez esetben Montenegrót!\r\n\r\nA 13 812 km2-en elterülő állam a Balkáni-félsziget délnyugati részén található. Határos Bosznia-Hercegovinával, Horvátországgal, Albániával és Szerbiával, partjait pedig az Adriai-tenger mossa.\r\n\r\nMenjünk vissza az időben és ismerkedjünk meg Montenegró történelmével.', 'https://www.youtube.com/embed/zSGDKicFUbs?si=SS9eZdLt5MzY1OOd'),
(16, 'Nepál', 'Nepal.gif', 'Nepált kulönböző éghajlati viszonyok jellemzik: a szubtrópusitól a sarki éghajlati övig, meglepő az ökoszisztémák keveredése. Eltérő táji egységeket találunk itt: dzsungeltől az erdős hegyek-völgyeken át hegyi sebes folyókkal egészen a magas hegységekig. A helyi lakosság és kultúra a természeti viszonyoktól függően fejlődött. Manapság több, mint 70 etnikai csoportot találunk itt, eltérő nyelvekkel, nyelvjárásokkal.\r\n', 'https://www.youtube.com/embed/gCRNEJxDJKM?si=VZkP226y39PUSOSD'),
(17, 'Norvégia', 'Norway.gif', 'Norvégia a vad és gyönyörű természet, a mesebeli trollok, a meredek vízesések, a tavak,a szárazföldbe mélyen behatoló fjordok és a hegyi havasok országa.', 'https://www.youtube.com/embed/KLuTLF3x9sA?si=5pP0OcsaMTB8p8qI'),
(18, 'Lengyelország', 'Poland.gif', 'Lengyelország egy közép - európai ország, mely határos Csehországgal, Németországgal, Szlovákiával, Fehéroroszországgal, Ukrajnával, Litvániával és Oroszországgal. Lengyelország fő büszkeségei a hegyek és az itt található természeti szépségek. A Tátra, Beszkidek, Kárpátok vagy a Krokonosi hegyek a történelmi emlékekkel egybevéve a turisták fő csábítói télen - nyáron Lengyelországban. További kiváló hely a Mazuri tavak és a Balti - tenger, amelyeket az ország északi részén találni. Lengyelország szigorúan katolikus ország, ahol megünneplik az összes katolikus ünnepet. A leglátogatottabb városok közé tartozik Varsó, majd Krakkó, Gdanszk vagy köszönhetően múltjának Auschwitz.\r\n', 'https://www.youtube.com/embed/ifVVc8xTas0?si=i_yTx7zh5xemmnoo'),
(19, 'Portugália', 'Portugal.gif', 'Portugália Dél-Nyugat Európában a Pireneusi-félszigeten és az Azori-szigeteken terül el. Északi és keleti szomszédja Spanyolország, nyugatról az Atlanti-óceán határolja. Hivatalosan Portugáliához tartoznak az Azori-szigetek és a Madeira szigetcsoport is.\r\n\r\nPortugáliáról fekvése alapján azt tartják, hogy ez az egyetlen ország, mely Európának hátatfordítva fejlődött, tekintetét csupán az óceánra szegezte. Miben rejtőzik e számunkra távoli ország különlegessége? Melankóliával átjárt hagyományos vendéglátásáról van szó -saudade, hagyomány, egyedülállóság az egyszerű dolgokban, finomság és az európai túlzottan gyors életmód hiánya. Kellemes érzés két kontinens közt teremni - egyik lábbal a jól ismert kontinensen, másikkal valahol a felhőkben ott, ahol végződik a szárazföld és ahol érezni az óceán illatát és súgását. Látogassa meg ezért a maur várak, zarándokhelyek, templomok, katedrálisok földjét, az országot ahol parafatölgyek nőnek, ahol érik a portói szőlő, ahonnan felfedezők indultak útra hajóikon, hogy új világot találjanak a miénknek... Boa viagem. Sikeres utat.', 'https://www.youtube.com/embed/O1dgtYkfQZU?si=eAq_QzE1rYcdY3Sw'),
(20, 'Katar', 'Qatar.gif', 'Katar egy közel-keleti arab emírség a Perzsa-öbölbe nyúló Katari-félszigeten. Területe Magyarországénak kb. a nyolcada, népessége pedig a harmada. A volt brit protektorátus 1971 óta független. A világ egyik legnagyobb kőolaj- és földgázkészletével rendelkezik, és gazdaságában nagyszámú külföldi munkavállalót alkalmaz.', 'https://www.youtube.com/embed/z6KxBS34mPg?si=lr59O7lW0_0dujvV'),
(21, 'Románia', 'Romania.gif', 'Képzeljen el egy szűz tájat , ahol az érintetlen hegycsúcsok és a Vörös-tenger partjai ellentétet képeznek. A napsütés, a tenger és homok kedvelői is megtalálhatják számításukat a Vörös-tenger valamelyik üdülőközpontjában. E térség központja a nagy kikötővel rendelkező Constanta, melynek közelében találhatók a legismertebb román üdülőközpontok: Mamaia és Eforie Nord. A magashegyi turizmust kedvelők értékelik majd a román hegyek nyújtotta szépséget, a legközkedveltebb a Fagaraše régió. Számos utazási iroda kínálatában szerepel a vad természet, a jól kijelölt turistaösvények, és az itteni állatvilág megismerését magábafoglaló program. További természeti érdekesség a Duna deltája az ukrán határon. A delta területe 5800 km2, számos állat- és növényfajnak ad otthont, az egyik legnagyobb madárfészkelőhelye Európának. A delta nemzeti parkjába Tulcsij városánál lehet bejutni, ahol a rezervátumba való belépéshez szükséges igazolványt állítják ki.', 'https://www.youtube.com/embed/WR9XnJWTALk?si=dWBijne9nEOPpy9X'),
(22, 'Oroszország', 'Russia.gif', 'A világ legnagyobb területű országa, Európánál másfélszer nagyobb. Két kontinensen: Európában és Ázsiában terül el. Európai részét a Kelet-Európai Alföld alkotja, melyet fennsíkok tagolnak. Délen a Kaukázusi-hegység határolja. Keleten az Urál-hegység választja el a Nyugat-Szibériai Alföldtől. Jenisej és Léna városa közt húzódik a Közép-Szibériai síkság, melyhez délen az Altáj és Szaján övezetek csatlakoznak. Lénától keletre az egyes kelet-szibériai hegyvonulatokat alföldek és medencék tagolják.\r\n', 'https://www.youtube.com/embed/lyh2kAjcmSY?si=OSBKhMMv5iqxznEb'),
(23, 'Szerbia', 'Serbia.gif', 'Szerbia és Monetenegró 2006. június 6-ától két különálló államot alkotnak. Jugoszláviát felidézve rájövünk, hogy Szerbia nem rendelkezik hosszú történelemmel. Az ország már magához tért a háborús  zavargások zűrzavarából. A fiatalok gyorsan alkalmazkodtak a nyugati divathoz, az utcán rendezetten és divatosan járnak. Az idősebb generáció tovább őrzi a hagyományokat.A kontraszt főként vidéken érződik.A modern nagyvárosok felzárkóztak az európai metropoliszokhoz, de a vidék arculatát mindmáig a pravoszláv templomok és kolostorok jellemzik. Több római kori építmény is található itt, főként Viminacijum környékén. Mindehhez érintetlen természet, tavak, termálforrások és karsztképződmények párosulnak. A két nemzeti park, Tara és Fruška Gora a jövő nemzedékei számára igyekszik megőrizni a természeti kincseket.', 'https://www.youtube.com/embed/GnCOBykmt1c?si=DkYTQlRFDhfNcOAK'),
(24, 'Szlovákia', 'Slovakia.gif', 'Szlovákia, hivatalosan Szlovák Köztársaság kelet-közép-európai állam a Kárpát-medence északi részén. Nyugatról Csehország és Ausztria, délről Magyarország, keletről Ukrajna, északról pedig Lengyelország határolja. Fővárosa és egyben legnagyobb városa Pozsony.', 'https://www.youtube.com/embed/wFijCHeNW6w?si=zdXheordXIfEAsYp'),
(25, 'Szlovénia', 'Slovenia.gif', 'Szlovénia Közép-Európa déli részén, az Alpok lábánál terül el. Nyugaton Olaszország, délnyugaton az Adriai-tenger, délen és keleten Horvátország, északkeleten Magyarország, északon Ausztria határolja. Fővárosa és legnépesebb városa Ljubljana.', 'https://www.youtube.com/embed/I5w2iDZvqS8?si=8qsphYMwim5xSwDi'),
(26, 'Spanyolország', 'Spain.gif', 'Spanyolország, hivatalos nevén Spanyol Királyság független állam Dél-Európában, illetve Észak- és Nyugat-Afrikában. A spanyol szárazföldet délről és keletről a Földközi-tenger, északról a Vizcayai-öböl és nyugatról az Atlanti-óceán határolja.', 'https://www.youtube.com/embed/6F-hjdpMc1U?si=MTaJos5q2wXG3pG-'),
(27, 'Törökország', 'Turkey.gif', 'Törökország állam, amelynek területe kisebbik részben Európában, nagyobbik részben Ázsia nyugati részén fekszik. A Fekete-tenger és a Földközi-tenger között elhelyezkedő Anatóliai-félsziget alkotja az ország fő területét.', 'https://www.youtube.com/embed/O-fsiL5i9JY?si=VInmmfJX0SGe8QP3'),
(28, 'Ukrajna', 'Ukraine.gif', 'Ukrajna kelet-európai állam. Keletről és északkeletről Oroszország, északnyugatról Fehéroroszország, nyugatról Lengyelország, Szlovákia és Magyarország, délnyugatról Románia és Moldova, délről pedig a Fekete-tenger és az Azovi-tenger határolja. Fővárosa és legnépesebb városa Kijev.', 'https://www.youtube.com/embed/D7SlK16o82o?si=9sdDDWWZfBk8w-SE'),
(29, 'Vietnám', 'Vietnam.gif', 'Vietnám vagy hivatalos nevén Vietnámi Szocialista Köztársaság szocialista berendezkedésű ország Délkelet-Ázsiában, Indokínai-félsziget keleti részén. Északról Kína, nyugatról Laosz és Kambodzsa, keletről pedig a Vietnámi-öböl határolja.', 'https://www.youtube.com/embed/_nlQtWA7QfQ?si=cKavncrksI2EJgxX'),
(39, 'proba2', 'dfgdf', 'sdfsddf', 'sdfsf');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `repulok`
--

CREATE TABLE `repulok` (
  `repulo_id` int(255) NOT NULL,
  `repulo_nev` varchar(255) NOT NULL,
  `repulo_honnan` int(11) NOT NULL,
  `repulo_hova` int(11) NOT NULL,
  `repulo_indulas` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `repulok`
--

INSERT INTO `repulok` (`repulo_id`, `repulo_nev`, `repulo_honnan`, `repulo_hova`, `repulo_indulas`) VALUES
(5, 'LOT3EZ', 1, 3, '2024-01-10 10:57:59'),
(6, 'THY2BL', 2, 4, '2024-01-23 20:58:08'),
(7, 'QTR35Q', 1, 4, '2024-01-29 04:38:16'),
(8, 'HYM3814', 2, 3, '2024-01-18 17:37:00');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `roles`
--

INSERT INTO `roles` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
(1, 'user', '2020-08-02 14:57:31', '2020-08-02 14:57:31'),
(2, 'moderator', '2020-08-02 14:57:31', '2020-08-02 14:57:31'),
(3, 'admin', '2020-08-02 14:57:31', '2020-08-02 14:57:31');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `segedvaros`
--

CREATE TABLE `segedvaros` (
  `seged_id` int(11) NOT NULL,
  `seged_nev` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `segedvaros`
--

INSERT INTO `segedvaros` (`seged_id`, `seged_nev`) VALUES
(1, 'Kína'),
(2, 'Japán'),
(3, 'Oroszország'),
(4, 'Magyarország'),
(5, 'Románia'),
(6, 'Ukrajna'),
(7, 'Ausztria');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `szavazat`
--

CREATE TABLE `szavazat` (
  `szavazat_id` int(11) NOT NULL,
  `szavazat_film` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `szavazat`
--

INSERT INTO `szavazat` (`szavazat_id`, `szavazat_film`) VALUES
(1, 1),
(2, 2),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 2),
(8, 1),
(9, 1),
(10, 3),
(11, 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `createdAt`, `updatedAt`) VALUES
(1, 'user', 'user', '$2a$08$gXM4pyuhZFlC72PeAwxrUOR0uA31/d2PdgnHP35JGV.0bQNiZBatS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'mod', 'mod', '$2a$08$gXM4pyuhZFlC72PeAwxrUOR0uA31/d2PdgnHP35JGV.0bQNiZBatS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'admin', 'admin', '$2a$08$97Ze1/hXfOX44WdC62Rq8uRkog9HYC1HukRX8eld2ZEKPyenM5v.G', '2020-08-02 15:03:59', '2020-08-02 15:03:59'),
(14, 'valaki', 'valaki@gmail.com', '$2a$08$2I9RHv7Yt6ljopICRKZq9.c/PzU.jDQU2zqtSD16A3kjQjbBuhw1a', '2024-02-06 17:37:10', '2024-02-06 17:37:10');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `user_roles`
--

CREATE TABLE `user_roles` (
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `roleId` int(11) NOT NULL,
  `userId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `user_roles`
--

INSERT INTO `user_roles` (`createdAt`, `updatedAt`, `roleId`, `userId`) VALUES
('0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 1),
('2020-08-02 15:04:00', '2020-08-02 15:04:00', 1, 3),
('2024-02-06 17:37:10', '2024-02-06 17:37:10', 1, 14),
('0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 2),
('0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3),
('2020-08-02 15:04:00', '2020-08-02 15:04:00', 3, 3);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `varosok`
--

CREATE TABLE `varosok` (
  `varos_id` int(11) NOT NULL,
  `varos_neve` varchar(255) NOT NULL,
  `orszag_id` int(11) NOT NULL,
  `varosok_kep` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `varosok`
--

INSERT INTO `varosok` (`varos_id`, `varos_neve`, `orszag_id`, `varosok_kep`) VALUES
(1, 'Budapest', 10, 'budapest.jpg'),
(2, 'Tirane', 1, 'tirane.jpeg'),
(3, 'Algír', 2, 'algir.jpg'),
(4, 'Bécs', 3, 'becs.jpg'),
(5, 'Brüsszel', 4, 'brusszel.jpg'),
(6, 'Szófia', 5, 'szofia.jpeg'),
(7, 'Ottawa', 6, 'ottawa.jpg'),
(8, 'Havanna', 7, 'havanna.jpg'),
(9, 'Nicosia', 8, 'nicosia.jpg'),
(10, 'Berlin', 9, 'berlin.jpg'),
(11, 'Reykjavík', 11, 'reykjavík.jfif'),
(12, 'Róma', 12, 'roma.jpg'),
(13, 'Tokió', 13, 'tokio.jpg'),
(14, 'Malé', 14, 'male.jpg'),
(15, 'Podgorica', 15, 'podgorica.jfif'),
(16, 'Katmandu', 16, 'katmandu.jpg'),
(17, 'Oslo', 17, 'oslo.jpg'),
(18, 'Varsó', 18, 'varso.jpg'),
(19, 'Lisszabon', 19, 'lisszabon.jpg'),
(20, 'Doha', 20, 'doha.jpg'),
(21, 'Bukarest', 21, 'bukarest.jpg'),
(22, 'Moszkva', 22, 'moszkva.jpg'),
(23, 'Belgrád', 23, 'belgrad.jpg'),
(24, 'Pozsony', 24, 'pozsony.jpg'),
(25, 'Ljubljana', 25, 'ljubljana.jpg'),
(26, 'Madrid', 26, ''),
(27, 'Ankara', 27, ''),
(28, 'Kijev', 28, ''),
(29, 'Hanoi', 29, '');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `erdekessegek`
--
ALTER TABLE `erdekessegek`
  ADD PRIMARY KEY (`erd_id`);

--
-- A tábla indexei `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`film_id`);

--
-- A tábla indexei `nevezetessegek`
--
ALTER TABLE `nevezetessegek`
  ADD PRIMARY KEY (`Nevezetesseg_id`);

--
-- A tábla indexei `nevjegy`
--
ALTER TABLE `nevjegy`
  ADD PRIMARY KEY (`Nevjegy_id`);

--
-- A tábla indexei `orszag`
--
ALTER TABLE `orszag`
  ADD PRIMARY KEY (`Orszag_id`);

--
-- A tábla indexei `repulok`
--
ALTER TABLE `repulok`
  ADD PRIMARY KEY (`repulo_id`);

--
-- A tábla indexei `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `segedvaros`
--
ALTER TABLE `segedvaros`
  ADD PRIMARY KEY (`seged_id`);

--
-- A tábla indexei `szavazat`
--
ALTER TABLE `szavazat`
  ADD PRIMARY KEY (`szavazat_id`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`roleId`,`userId`),
  ADD KEY `userId` (`userId`);

--
-- A tábla indexei `varosok`
--
ALTER TABLE `varosok`
  ADD PRIMARY KEY (`varos_id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `erdekessegek`
--
ALTER TABLE `erdekessegek`
  MODIFY `erd_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT a táblához `film`
--
ALTER TABLE `film`
  MODIFY `film_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT a táblához `nevezetessegek`
--
ALTER TABLE `nevezetessegek`
  MODIFY `Nevezetesseg_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT a táblához `nevjegy`
--
ALTER TABLE `nevjegy`
  MODIFY `Nevjegy_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT a táblához `orszag`
--
ALTER TABLE `orszag`
  MODIFY `Orszag_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT a táblához `repulok`
--
ALTER TABLE `repulok`
  MODIFY `repulo_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT a táblához `segedvaros`
--
ALTER TABLE `segedvaros`
  MODIFY `seged_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT a táblához `szavazat`
--
ALTER TABLE `szavazat`
  MODIFY `szavazat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT a táblához `varosok`
--
ALTER TABLE `varosok`
  MODIFY `varos_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_roles_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
