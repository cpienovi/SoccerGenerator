//
//  TeamUtils.swift
//  SoccerGenerator
//
//  Created by Carlos Pienovi on 7/11/17.
//  Copyright © 2017 Carlos Pienovi. All rights reserved.
//

import Foundation

public class TeamUtils {
    
    public static let allTeams =
        [
            // ALKA SUPERLIGA
            "Brøndby IF",
            "Silkeborg IF",
            "Aarhus GF",
            "Odense Boldklub",
            "FC København",
            "Aalborg BK",
            "Viborg FF",
            "Esbjerg fB",
            "AC Horsens",
            "SønderjyskE",
            "FC Midtjylland",
            "Randers FC",
            "FC Nordsjælland",
            "Lyngby BK",
            // PRO LEAGUE
            "RSC Anderlecht",
            "Club Brugge",
            "Standard Liège",
            "Sp. Charleroi",
            "KRC Genk",
            "KAA Gent",
            "Sint-Truiden",
            "KVC Westerlo",
            "KV Oostende",
            "Sport. Lokeren",
            "KAS Eupen",
            "Zulte-Waregem",
            "KV Kortrijk",
            "KV Mechelen",
            "Waasland-Beveren",
            "Excel Mouscron",
            // LIGA DO BRASIL
            "Palmeiras",
            "Botafogo",
            "Fluminense",
            "Cruzeiro",
            "São Paulo",
            "Atlético Mineiro",
            "Atlético Paranaense",
            "Internacional",
            "Santos",
            "Grêmio",
            "Vitória",
            "Ponte Preta",
            "Coritiba",
            "Figueirense",
            "Sport",
            "Santa Cruz",
            "América Mineiro",
            "Chapecoense",
            // EREDIVISIE
            "Ajax",
            "Feyenoord",
            "PSV",
            "ADO Den Haag",
            "Roda JC Kerkrade",
            "FC Utrecht",
            "AZ",
            "Willem II",
            "FC Twente",
            "Vitesse",
            "NEC",
            "SC Heerenveen",
            "PEC Zwolle",
            "FC Groningen",
            "Excelsior",
            "Go Ahead Eagles",
            "Heracles Almelo",
            "Sparta Rotterdam",
            // PREMIER LEAGUE
            "Arsenal",
            "Chelsea",
            "Everton",
            "Liverpool",
            "Manchester City",
            "Manchester United",
            "Middlesbrough",
            "Southampton",
            "Tottenham Hotspur",
            "West Ham United",
            "Leicester City",
            "Sunderland",
            "West Bromwich Albion",
            "Watford",
            "Burnley",
            "Crystal Palace",
            "Stoke City",
            "Bournemouth",
            "Hull City",
            "Swansea City",
            // EFL CHAMPIONSHIP
            "Aston Villa",
            "Blackburn Rovers",
            "Leeds United",
            "Newcastle United",
            "Nottingham Forest",
            "Queens Park Rangers",
            "Birmingham City",
            "Derby County",
            "Ipswich Town",
            "Wolverhampton Wanderers",
            "Fulham",
            "Norwich City",
            "Reading",
            "Rotherham United",
            "Preston North End",
            "Sheffield Wednesday",
            "Brighton & Hove Albion",
            "Wigan Athletic",
            "Bristol City",
            "Brentford",
            "Barnsley",
            "Huddersfield Town",
            "Cardiff City",
            "Burton Albion",
            // LIGUE 1
            "SC Bastia",
            "Girondins de Bordeaux",
            "En Avant Guingamp",
            "LOSC Lille",
            "Olympique Lyonnais",
            "FC Metz",
            "AS Monaco",
            "Montpellier HSC",
            "FC Nantes",
            "OGC Nice",
            "Paris Saint-Germain",
            "Stade Rennais",
            "SM Caen",
            "FC Lorient",
            "Olympique de Marseille",
            "Angers SCO",
            "Toulouse FC",
            "AS Saint-Étienne",
            "AS Nancy",
            "Dijon Football",
            // DOMINO’S LIGUE 2
            "AJ Auxerre",
            "Racing Club de Lens",
            "RC Strasbourg",
            "Nîmes Olympique",
            "FC Sochaux",
            "ES Troyes AC",
            "Stade Brestois 29",
            "Stade de Reims",
            "AC Ajaccio",
            "Le Havre AC",
            "Chamois Niortais FC",
            "Stade Lavallois MFC",
            "Clermont Foot",
            "Amiens SC",
            "GFC Ajaccio",
            "Tours FC",
            "Valenciennes FC",
            "Bourg en Bresse 01",
            "Red Star FC",
            "US Orléans",
            // BUNDESLIGA
            "Bayern München",
            "Borussia Dortmund",
            "Borussia M'gladbach",
            "SC Freiburg",
            "Hamburger SV",
            "FC Köln",
            "Bayer 04 Leverkusen",
            "FC Schalke 04",
            "SV Werder Bremen",
            "Hertha BSC",
            "FSV Mainz 05",
            "VfL Wolfsburg",
            "Eintracht Frankfurt",
            "TSG 1899 Hoffenheim",
            "FC Augsburg",
            "SV Darmstadt 98",
            "FC Ingolstadt 04",
            "RB Leipzig",
            // BUNDESLIGA 2
            "FC Kaiserslautern",
            "TSV 1860 München",
            "VfB Stuttgart",
            "Arminia Bielefeld",
            "VfL Bochum",
            "SpVgg Greuther Fürth",
            "FC Nürnberg",
            "Hannover 96",
            "Dynamo Dresden",
            "Erzgebirge Aue",
            "FC Union Berlin",
            "Karlsruher SC",
            "SV Sandhausen",
            "Würzburger Kickers",
            "FC St. Pauli",
            "Eintracht Braunschweig",
            "Fortuna Düsseldorf",
            "FC Heidenheim",
            // CALCIO A
            "Atalanta",
            "Inter",
            "Juventus",
            "Lazio",
            "Milan",
            "Napoli",
            "Roma",
            "Torino",
            "Udinese",
            "Bologna",
            "Chievo Verona",
            "Pescara",
            "Empoli",
            "Sampdoria",
            "Cagliari",
            "Palermo",
            "Fiorentina",
            "Genoa",
            "Crotone",
            "Sassuolo",
            // CALCIO B
            "Brescia",
            "Perugia",
            "Hellas Verona",
            "Ternana",
            "Ascoli",
            "Bari",
            "Avellino",
            "Salernitana",
            "Pisa",
            "Spezia",
            "Cesena",
            "Frosinone",
            "Cittadella",
            "Benevento",
            "Novara",
            "Pro Vercelli",
            "Carpi",
            "Trapani",
            "Latina",
            "Spal",
            "Vicenza",
            "Virtus Entella",
            // MLS
            "Columbus Crew SC",
            "D.C. United",
            "New York Red Bulls",
            "New England Revolution",
            "Chicago Fire",
            "Colorado Rapids",
            "FC Dallas",
            "Sporting KC",
            "Los Angeles Galaxy",
            "Houston Dynamo",
            "Vancouver Whitecaps",
            "Real Salt Lake",
            "Montreal Impact",
            "Portland Timbers",
            "Seattle Sounders",
            "Toronto FC",
            "San Jose Earthquakes",
            "Philadelphia Union",
            "Orlando City SC",
            "New York City FC",
            // TIPPELIGAEN
            "Rosenborg BK",
            "Lillestrøm SK",
            "Viking FK",
            "Molde FK",
            "Tromsø IL",
            "Stabæk Fotball",
            "FK Bodø/Glimt",
            "SK Brann",
            "Vålerenga",
            "Strømsgodset Toppfotball",
            "Odds Ballklubb",
            "FK Haugesund",
            "Sogndal Fotball",
            "IK Start",
            "Aalesunds FK",
            "Sarpsborg 08 FF",
            // SCOTTISH PREM
            "Aberdeen",
            "Celtic",
            "Heart of Midlothian",
            "Kilmarnock",
            "Motherwell",
            "Rangers",
            "Dundee FC",
            "Hamilton Academical",
            "Inverness Caledonian Thistle",
            "Ross County",
            "Partick Thistle",
            "St. Johnstone",
            // LALIGA SANTANDER
            "Atlético de Madrid",
            "FC Barcelona",
            "RC Deportivo",
            "Real Madrid",
            "Athletic Club de Bilbao",
            "Real Betis Balompié",
            "RC Celta de Vigo",
            "RCD Espanyol",
            "Real Sociedad",
            "Real Sporting de Gijón",
            "Valencia CF",
            "Deportivo Alavés",
            "SD Eibar",
            "UD Las Palmas",
            "CA Osasuna",
            "Sevilla FC",
            "Villarreal CF",
            "Málaga CF",
            "CD Leganés",
            "Granada CF",
            // LALIGA 1|2|3
            "Real Zaragoza",
            "CD Tenerife",
            "RCD Mallorca",
            "Real Valladolid",
            "Elche CF",
            "CD Numancia",
            "Rayo Vallecano",
            "Levante UD",
            "Getafe CF",
            "UD Almería",
            "Córdoba CF",
            "Cádiz CF",
            "Nástic de Tarragona",
            "AD Alcorcón",
            "Girona FC",
            "CD Mirandés",
            "Sevilla Atlético",
            "Real Oviedo",
            "CD Lugo",
            "SD Huesca",
            "CF Reus Deportiu",
            "UCAM Murcia",
            // ALLSVENSKAN
            "IFK Göteborg",
            "Malmö FF",
            "Helsingborgs IF",
            "AIK",
            "IF Elfsborg",
            "IFK Norrköping",
            "Örebro SK",
            "Hammarby IF",
            "Djurgårdens IF",
            "BK Häcken",
            "Kalmar FF",
            "GIF Sundsvall",
            "Gefle IF",
            "Jönköpings Södra IF",
            "Falkenbergs FF",
            "Östersunds FK",
            // EFL LEAGUE ONE
            "Bolton Wanderers",
            "Charlton Athletic",
            "Millwall",
            "Shrewsbury Town",
            "Sheffield United",
            "Milton Keynes Dons",
            "Coventry City",
            "Gillingham",
            "Walsall",
            "Bradford City",
            "Oldham Athletic",
            "Chesterfield",
            "Port Vale",
            "Northampton Town",
            "Swindon Town",
            "Peterborough United",
            "Bury",
            "Scunthorpe United",
            "Oxford United",
            "Southend United",
            "Rochdale",
            "Bristol Rovers",
            "AFC Wimbledon",
            "Fleetwood Town",
            // EFL LEAGUE TWO
            "Grimsby Town",
            "Crewe Alexandra",
            "Barnet",
            "Doncaster Rovers",
            "Exeter City",
            "Yeovil Town",
            "Morecambe",
            "Stevenage",
            "Carlisle United",
            "Portsmouth",
            "Luton Town",
            "Blackpool",
            "Plymouth Argyle",
            "Wycombe Wanderers",
            "Colchester United",
            "Cheltenham Town",
            "Notts County",
            "Mansfield Town",
            "Hartlepool United",
            "Cambridge United",
            "Leyton Orient",
            "Accrington Stanley",
            "Crawley Town",
            "Newport County",
            // SSE AIRTRICITY LGE
            "Bohemian FC",
            "Shamrock Rovers",
            "Cork City",
            "St. Patrick's Athletic",
            "Derry City",
            "Sligo Rovers",
            "Dundalk FC",
            "Bray Wanderers",
            "Galway United",
            "Longford Town",
            "Finn Harps",
            "Wexford Youths",
            // EKSTRAKLASA
            "Lech Poznań",
            "Ruch Chorzów",
            "Wisła Płock",
            "Legia Warszawa",
            "Wisła Kraków",
            "Górnik Łęczna",
            "Jagiellonia Białystok",
            "Pogoń Szczecin",
            "Cracovia Kraków",
            "Zagłębie Lubin",
            "Arka Gdynia",
            "Korona Kielce",
            "Piast Gliwice",
            "Lechia Gdańsk",
            "Śląsk Wrocław",
            "Bruk-Bet Termalica Nieciecza",
            // RUSSIAN LEAGUE
            "CSKA Moskva",
            "Krylya Sovetov Samara",
            "Lokomotiv Moskva",
            "Anzhi Makhachkala",
            "Spartak Moskva",
            "Zenit St. Petersburg",
            "Terek Grozny",
            "Rubin Kazan",
            "FC Rostov",
            "Tom Tomsk",
            "Amkar Perm",
            "Arsenal Tula",
            "FC Ufa",
            "FC Ural",
            "FC Krasnodar",
            "FC Orenburg",
            // SÜPER LIG
            "Galatasaray",
            "Fenerbahçe",
            "Beşiktaş",
            "Trabzonspor",
            "Antalyaspor",
            "Bursaspor",
            "Medipol Başakşehir",
            "Kayserispor",
            "Gaziantepspor",
            "Gençlerbirliği",
            "Atiker Konyaspor",
            "Çaykur Rizespor",
            "Adanaspor",
            "Kasımpaşa",
            "Akhisarspor",
            "Kardemir Karabükspor",
            "Osmanlıspor",
            "Alanyaspor",
            // REST OF WORLD
            "Olympiacos CFP",
            "PAOK FC",
            "Vasco da Gama",
            "Panathinaikos FC",
            "HJK Helsinki",
            "Shakhtar Donetsk",
            "Kaizer Chiefs",
            "Orlando Pirates",
            "Goiás",
            "Criciúma",
            "Joinville",
            "World XI",
            "Classic XI",
            "MLS All Stars",
            "Avaí",
            "adidas All-Star Team",
            // MEN'S NATIONAL
            "England",
            "Austria",
            "Belgium",
            "Bulgaria",
            "Czech Republic",
            "Denmark",
            "Finland",
            "France",
            "Germany",
            "Greece",
            "Italy",
            "Norway",
            "Poland",
            "Portugal",
            "Republic of Ireland",
            "Romania",
            "Russia",
            "Scotland",
            "Slovenia",
            "Spain",
            "Sweden",
            "Switzerland",
            "Turkey",
            "Wales",
            "Argentina",
            "Brazil",
            "Paraguay",
            "Uruguay",
            "Mexico",
            "United States",
            "Cameroon",
            "China PR",
            "Australia",
            "Hungary",
            "Netherlands",
            "Northern Ireland",
            "South Africa",
            "Peru",
            "Colombia",
            "Cote d'Ivoire",
            "Egypt",
            "Bolivia",
            "Canada",
            "Chile",
            "Ecuador",
            "India",
            "Venezuela",
            // Ö. BUNDESLIGA
            "Red Bull Salzburg",
            "Sturm Graz",
            "Rapid Wien",
            "Austria Wien",
            "SV Ried",
            "SV Mattersburg",
            "SCR Altach",
            "FC Admira Wacker Mödling",
            "Wolfsberger AC",
            "SKN St. Pölten",
            // K LEAGUE CLASSIC
            "Seongnam FC",
            "FC Seoul",
            "Suwon Samsung Bluewings",
            "Ulsan Hyundai",
            "Pohang Steelers",
            "Jeonnam Dragons",
            "Jeonbuk Hyundai Motors",
            "Jeju United",
            "Sangju Sangmu",
            "Incheon United",
            "Gwangju FC",
            "Suwon FC",
            // RSL
            "FC Vaduz",
            "Grasshopper Club Zürich",
            "FC Basel",
            "FC Luzern",
            "FC St. Gallen",
            "BSC Young Boys",
            "FC Thun",
            "FC Lausanne-Sport",
            "FC Lugano",
            "FC Sion",
            // LIGA NOS
            "SL Benfica",
            "FC Porto",
            "Sporting CP",
            "Chaves",
            "Vitória Setúbal",
            "Rio Ave",
            "Vitória Guimarães",
            "Belenenses",
            "Nacional",
            "Paços de Ferreira",
            "Marítimo",
            "SC Braga",
            "Boavista",
            "Moreirense",
            "Feirense",
            "Estoril Praia",
            "Arouca",
            "Tondela",
            // CAMP. SCOTIABANK
            "Universidad de Chile",
            "Audax Italiano",
            "Universidad Católica",
            "Santiago Wanderers",
            "Unión Española",
            "Cobresal",
            "Colo-Colo",
            "CD Huachipato",
            "CD Palestino",
            "CD O'Higgins",
            "Deportes Iquique",
            "Deportes Antofagasta",
            "Universidad de Concepción",
            "Everton de Viña del Mar",
            "San Luis de Quillota",
            "Deportes Temuco",
            // LIGA DIMAYOR
            "Atlético Nacional",
            "Junior Barranquilla",
            "Deportivo Cali",
            "Independiente Medellín",
            "Independiente Santa Fe",
            "Millonarios",
            "Once Caldas",
            "Deportes Tolima",
            "Deportivo Pasto",
            "Boyacá Chicó",
            "La Equidad",
            "Envigado",
            "Patriotas Boyacá",
            "Atlético Huila",
            "Rionegro Águilas",
            "Alianza Petrolera",
            "Fortaleza CEIF",
            "Jaguares de Córdoba",
            "Cortuluá",
            "Atlético Bucaramanga",
            // LIGA BANCOMER MX
            "Monarcas Morelia",
            "Monterrey",
            "Cruz Azul",
            "América",
            "Guadalajara",
            "U.N.A.M.",
            "Toluca",
            "Tigres U.A.N.L.",
            "Atlas",
            "Necaxa",
            "Santos Laguna",
            "Tiburones Rojos de Veracruz",
            "Pachuca",
            "Gallos Blancos de Querétaro",
            "Puebla",
            "León",
            "Tijuana",
            "Chiapas FC",
            // MEIJI YASUDA J1
            "Júbilo Iwata",
            "Kashiwa Reysol",
            "Vissel Kobe",
            "Kashima Antlers",
            "FC Tokyo",
            "Yokohama F. Marinos",
            "Urawa Red Diamonds",
            "Kawasaki Frontale",
            "Nagoya Grampus",
            "Gamba Osaka",
            "Omiya Ardija",
            "Vegalta Sendai",
            "Albirex Niigata",
            "Sanfrecce Hiroshima",
            "Sagan Tosu",
            "Shonan Bellmare",
            "Ventforet Kofu",
            "Avispa Fukuoka",
            // DAWRY JAMEEL
            "Al Hilal",
            "Al Ittihad",
            "Al Shabab",
            "Al Ettifaq",
            "Al Nassr",
            "Al Ahli",
            "Al Faisaly",
            "Al Fateh",
            "Al Qadisiyah",
            "Al Raed",
            "Al Taawoun",
            "Al Wehda",
            "Al Khaleej",
            "Al Batin",
            // HYUNDAI A-LEAGUE
            "Adelaide United",
            "Brisbane Roar",
            "Central Coast Mariners",
            "Melbourne Victory",
            "Newcastle Jets",
            "Perth Glory",
            "Sydney FC",
            "Wellington Phoenix",
            "Melbourne City",
            "Western Sydney Wanderers",
            // PRIMERA DIVISIÓN
            "San Lorenzo de Almagro",
            "River Plate",
            "Boca Juniors",
            "Estudiantes de La Plata",
            "Gimnasia y Esgrima La Plata",
            "Racing Club de Avellaneda",
            "Vélez Sarsfield",
            "Independiente",
            "Atlético de Rafaela",
            "Arsenal de Sarandi",
            "Lanús",
            "Newell's Old Boys",
            "Olimpo Bahía Blanca",
            "Banfield",
            "Colón",
            "Quilmes Atlético Club",
            "Rosario Central",
            "Patronato",
            "Belgrano de Córdoba",
            "Godoy Cruz",
            "Aldosivi",
            "Atlético Tucumán",
            "Defensa y Justicia",
            "Huracán",
            "San Martín de San Juan",
            "Club Atlético Tigre",
            "Unión Santa Fe",
            "Talleres de Córdoba",
            "Sarmiento",
            "Temperley"
    ].sorted { $0.localizedCaseInsensitiveCompare($1) == ComparisonResult.orderedAscending }

    
}
