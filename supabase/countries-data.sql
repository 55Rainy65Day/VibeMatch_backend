-- Countries data for VibesMatch
-- Insert all world countries with ISO codes, continents, and basic information

INSERT INTO countries (code, code3, name, continent, region, capital, currency_code, phone_code) VALUES
-- Africa
('DZ', 'DZA', 'Algeria', 'Africa', 'Northern Africa', 'Algiers', 'DZD', '+213'),
('AO', 'AGO', 'Angola', 'Africa', 'Middle Africa', 'Luanda', 'AOA', '+244'),
('BJ', 'BEN', 'Benin', 'Africa', 'Western Africa', 'Porto-Novo', 'XOF', '+229'),
('BW', 'BWA', 'Botswana', 'Africa', 'Southern Africa', 'Gaborone', 'BWP', '+267'),
('BF', 'BFA', 'Burkina Faso', 'Africa', 'Western Africa', 'Ouagadougou', 'XOF', '+226'),
('BI', 'BDI', 'Burundi', 'Africa', 'Eastern Africa', 'Gitega', 'BIF', '+257'),
('CV', 'CPV', 'Cape Verde', 'Africa', 'Western Africa', 'Praia', 'CVE', '+238'),
('CM', 'CMR', 'Cameroon', 'Africa', 'Middle Africa', 'Yaoundé', 'XAF', '+237'),
('CF', 'CAF', 'Central African Republic', 'Africa', 'Middle Africa', 'Bangui', 'XAF', '+236'),
('TD', 'TCD', 'Chad', 'Africa', 'Middle Africa', 'N''Djamena', 'XAF', '+235'),
('KM', 'COM', 'Comoros', 'Africa', 'Eastern Africa', 'Moroni', 'KMF', '+269'),
('CG', 'COG', 'Congo', 'Africa', 'Middle Africa', 'Brazzaville', 'XAF', '+242'),
('CD', 'COD', 'Democratic Republic of the Congo', 'Africa', 'Middle Africa', 'Kinshasa', 'CDF', '+243'),
('CI', 'CIV', 'Côte d''Ivoire', 'Africa', 'Western Africa', 'Yamoussoukro', 'XOF', '+225'),
('DJ', 'DJI', 'Djibouti', 'Africa', 'Eastern Africa', 'Djibouti', 'DJF', '+253'),
('EG', 'EGY', 'Egypt', 'Africa', 'Northern Africa', 'Cairo', 'EGP', '+20'),
('GQ', 'GNQ', 'Equatorial Guinea', 'Africa', 'Middle Africa', 'Malabo', 'XAF', '+240'),
('ER', 'ERI', 'Eritrea', 'Africa', 'Eastern Africa', 'Asmara', 'ERN', '+291'),
('SZ', 'SWZ', 'Eswatini', 'Africa', 'Southern Africa', 'Mbabane', 'SZL', '+268'),
('ET', 'ETH', 'Ethiopia', 'Africa', 'Eastern Africa', 'Addis Ababa', 'ETB', '+251'),
('GA', 'GAB', 'Gabon', 'Africa', 'Middle Africa', 'Libreville', 'XAF', '+241'),
('GM', 'GMB', 'Gambia', 'Africa', 'Western Africa', 'Banjul', 'GMD', '+220'),
('GH', 'GHA', 'Ghana', 'Africa', 'Western Africa', 'Accra', 'GHS', '+233'),
('GN', 'GIN', 'Guinea', 'Africa', 'Western Africa', 'Conakry', 'GNF', '+224'),
('GW', 'GNB', 'Guinea-Bissau', 'Africa', 'Western Africa', 'Bissau', 'XOF', '+245'),
('KE', 'KEN', 'Kenya', 'Africa', 'Eastern Africa', 'Nairobi', 'KES', '+254'),
('LS', 'LSO', 'Lesotho', 'Africa', 'Southern Africa', 'Maseru', 'LSL', '+266'),
('LR', 'LBR', 'Liberia', 'Africa', 'Western Africa', 'Monrovia', 'LRD', '+231'),
('LY', 'LBY', 'Libya', 'Africa', 'Northern Africa', 'Tripoli', 'LYD', '+218'),
('MG', 'MDG', 'Madagascar', 'Africa', 'Eastern Africa', 'Antananarivo', 'MGA', '+261'),
('MW', 'MWI', 'Malawi', 'Africa', 'Eastern Africa', 'Lilongwe', 'MWK', '+265'),
('ML', 'MLI', 'Mali', 'Africa', 'Western Africa', 'Bamako', 'XOF', '+223'),
('MR', 'MRT', 'Mauritania', 'Africa', 'Western Africa', 'Nouakchott', 'MRU', '+222'),
('MU', 'MUS', 'Mauritius', 'Africa', 'Eastern Africa', 'Port Louis', 'MUR', '+230'),
('MA', 'MAR', 'Morocco', 'Africa', 'Northern Africa', 'Rabat', 'MAD', '+212'),
('MZ', 'MOZ', 'Mozambique', 'Africa', 'Eastern Africa', 'Maputo', 'MZN', '+258'),
('NA', 'NAM', 'Namibia', 'Africa', 'Southern Africa', 'Windhoek', 'NAD', '+264'),
('NE', 'NER', 'Niger', 'Africa', 'Western Africa', 'Niamey', 'XOF', '+227'),
('NG', 'NGA', 'Nigeria', 'Africa', 'Western Africa', 'Abuja', 'NGN', '+234'),
('RW', 'RWA', 'Rwanda', 'Africa', 'Eastern Africa', 'Kigali', 'RWF', '+250'),
('ST', 'STP', 'São Tomé and Príncipe', 'Africa', 'Middle Africa', 'São Tomé', 'STN', '+239'),
('SN', 'SEN', 'Senegal', 'Africa', 'Western Africa', 'Dakar', 'XOF', '+221'),
('SC', 'SYC', 'Seychelles', 'Africa', 'Eastern Africa', 'Victoria', 'SCR', '+248'),
('SL', 'SLE', 'Sierra Leone', 'Africa', 'Western Africa', 'Freetown', 'SLL', '+232'),
('SO', 'SOM', 'Somalia', 'Africa', 'Eastern Africa', 'Mogadishu', 'SOS', '+252'),
('ZA', 'ZAF', 'South Africa', 'Africa', 'Southern Africa', 'Cape Town', 'ZAR', '+27'),
('SS', 'SSD', 'South Sudan', 'Africa', 'Eastern Africa', 'Juba', 'SSP', '+211'),
('SD', 'SDN', 'Sudan', 'Africa', 'Northern Africa', 'Khartoum', 'SDG', '+249'),
('TZ', 'TZA', 'Tanzania', 'Africa', 'Eastern Africa', 'Dodoma', 'TZS', '+255'),
('TG', 'TGO', 'Togo', 'Africa', 'Western Africa', 'Lomé', 'XOF', '+228'),
('TN', 'TUN', 'Tunisia', 'Africa', 'Northern Africa', 'Tunis', 'TND', '+216'),
('UG', 'UGA', 'Uganda', 'Africa', 'Eastern Africa', 'Kampala', 'UGX', '+256'),
('ZM', 'ZMB', 'Zambia', 'Africa', 'Eastern Africa', 'Lusaka', 'ZMW', '+260'),
('ZW', 'ZWE', 'Zimbabwe', 'Africa', 'Eastern Africa', 'Harare', 'ZWL', '+263'),

-- Asia
('AF', 'AFG', 'Afghanistan', 'Asia', 'Southern Asia', 'Kabul', 'AFN', '+93'),
('AM', 'ARM', 'Armenia', 'Asia', 'Western Asia', 'Yerevan', 'AMD', '+374'),
('AZ', 'AZE', 'Azerbaijan', 'Asia', 'Western Asia', 'Baku', 'AZN', '+994'),
('BH', 'BHR', 'Bahrain', 'Asia', 'Western Asia', 'Manama', 'BHD', '+973'),
('BD', 'BGD', 'Bangladesh', 'Asia', 'Southern Asia', 'Dhaka', 'BDT', '+880'),
('BT', 'BTN', 'Bhutan', 'Asia', 'Southern Asia', 'Thimphu', 'BTN', '+975'),
('BN', 'BRN', 'Brunei', 'Asia', 'South-Eastern Asia', 'Bandar Seri Begawan', 'BND', '+673'),
('KH', 'KHM', 'Cambodia', 'Asia', 'South-Eastern Asia', 'Phnom Penh', 'KHR', '+855'),
('CN', 'CHN', 'China', 'Asia', 'Eastern Asia', 'Beijing', 'CNY', '+86'),
('CY', 'CYP', 'Cyprus', 'Asia', 'Western Asia', 'Nicosia', 'EUR', '+357'),
('GE', 'GEO', 'Georgia', 'Asia', 'Western Asia', 'Tbilisi', 'GEL', '+995'),
('IN', 'IND', 'India', 'Asia', 'Southern Asia', 'New Delhi', 'INR', '+91'),
('ID', 'IDN', 'Indonesia', 'Asia', 'South-Eastern Asia', 'Jakarta', 'IDR', '+62'),
('IR', 'IRN', 'Iran', 'Asia', 'Southern Asia', 'Tehran', 'IRR', '+98'),
('IQ', 'IRQ', 'Iraq', 'Asia', 'Western Asia', 'Baghdad', 'IQD', '+964'),
('IL', 'ISR', 'Israel', 'Asia', 'Western Asia', 'Jerusalem', 'ILS', '+972'),
('JP', 'JPN', 'Japan', 'Asia', 'Eastern Asia', 'Tokyo', 'JPY', '+81'),
('JO', 'JOR', 'Jordan', 'Asia', 'Western Asia', 'Amman', 'JOD', '+962'),
('KZ', 'KAZ', 'Kazakhstan', 'Asia', 'Central Asia', 'Nur-Sultan', 'KZT', '+7'),
('KW', 'KWT', 'Kuwait', 'Asia', 'Western Asia', 'Kuwait City', 'KWD', '+965'),
('KG', 'KGZ', 'Kyrgyzstan', 'Asia', 'Central Asia', 'Bishkek', 'KGS', '+996'),
('LA', 'LAO', 'Laos', 'Asia', 'South-Eastern Asia', 'Vientiane', 'LAK', '+856'),
('LB', 'LBN', 'Lebanon', 'Asia', 'Western Asia', 'Beirut', 'LBP', '+961'),
('MY', 'MYS', 'Malaysia', 'Asia', 'South-Eastern Asia', 'Kuala Lumpur', 'MYR', '+60'),
('MV', 'MDV', 'Maldives', 'Asia', 'Southern Asia', 'Malé', 'MVR', '+960'),
('MN', 'MNG', 'Mongolia', 'Asia', 'Eastern Asia', 'Ulaanbaatar', 'MNT', '+976'),
('MM', 'MMR', 'Myanmar', 'Asia', 'South-Eastern Asia', 'Naypyidaw', 'MMK', '+95'),
('NP', 'NPL', 'Nepal', 'Asia', 'Southern Asia', 'Kathmandu', 'NPR', '+977'),
('KP', 'PRK', 'North Korea', 'Asia', 'Eastern Asia', 'Pyongyang', 'KPW', '+850'),
('OM', 'OMN', 'Oman', 'Asia', 'Western Asia', 'Muscat', 'OMR', '+968'),
('PK', 'PAK', 'Pakistan', 'Asia', 'Southern Asia', 'Islamabad', 'PKR', '+92'),
('PS', 'PSE', 'Palestine', 'Asia', 'Western Asia', 'Ramallah', 'ILS', '+970'),
('PH', 'PHL', 'Philippines', 'Asia', 'South-Eastern Asia', 'Manila', 'PHP', '+63'),
('QA', 'QAT', 'Qatar', 'Asia', 'Western Asia', 'Doha', 'QAR', '+974'),
('SA', 'SAU', 'Saudi Arabia', 'Asia', 'Western Asia', 'Riyadh', 'SAR', '+966'),
('SG', 'SGP', 'Singapore', 'Asia', 'South-Eastern Asia', 'Singapore', 'SGD', '+65'),
('KR', 'KOR', 'South Korea', 'Asia', 'Eastern Asia', 'Seoul', 'KRW', '+82'),
('LK', 'LKA', 'Sri Lanka', 'Asia', 'Southern Asia', 'Sri Jayawardenepura Kotte', 'LKR', '+94'),
('SY', 'SYR', 'Syria', 'Asia', 'Western Asia', 'Damascus', 'SYP', '+963'),
('TW', 'TWN', 'Taiwan', 'Asia', 'Eastern Asia', 'Taipei', 'TWD', '+886'),
('TJ', 'TJK', 'Tajikistan', 'Asia', 'Central Asia', 'Dushanbe', 'TJS', '+992'),
('TH', 'THA', 'Thailand', 'Asia', 'South-Eastern Asia', 'Bangkok', 'THB', '+66'),
('TL', 'TLS', 'Timor-Leste', 'Asia', 'South-Eastern Asia', 'Dili', 'USD', '+670'),
('TR', 'TUR', 'Turkey', 'Asia', 'Western Asia', 'Ankara', 'TRY', '+90'),
('TM', 'TKM', 'Turkmenistan', 'Asia', 'Central Asia', 'Ashgabat', 'TMT', '+993'),
('AE', 'ARE', 'United Arab Emirates', 'Asia', 'Western Asia', 'Abu Dhabi', 'AED', '+971'),
('UZ', 'UZB', 'Uzbekistan', 'Asia', 'Central Asia', 'Tashkent', 'UZS', '+998'),
('VN', 'VNM', 'Vietnam', 'Asia', 'South-Eastern Asia', 'Hanoi', 'VND', '+84'),
('YE', 'YEM', 'Yemen', 'Asia', 'Western Asia', 'Sana''a', 'YER', '+967'),

-- Europe
('AL', 'ALB', 'Albania', 'Europe', 'Southern Europe', 'Tirana', 'ALL', '+355'),
('AD', 'AND', 'Andorra', 'Europe', 'Southern Europe', 'Andorra la Vella', 'EUR', '+376'),
('AT', 'AUT', 'Austria', 'Europe', 'Western Europe', 'Vienna', 'EUR', '+43'),
('BY', 'BLR', 'Belarus', 'Europe', 'Eastern Europe', 'Minsk', 'BYN', '+375'),
('BE', 'BEL', 'Belgium', 'Europe', 'Western Europe', 'Brussels', 'EUR', '+32'),
('BA', 'BIH', 'Bosnia and Herzegovina', 'Europe', 'Southern Europe', 'Sarajevo', 'BAM', '+387'),
('BG', 'BGR', 'Bulgaria', 'Europe', 'Eastern Europe', 'Sofia', 'BGN', '+359'),
('HR', 'HRV', 'Croatia', 'Europe', 'Southern Europe', 'Zagreb', 'EUR', '+385'),
('CZ', 'CZE', 'Czech Republic', 'Europe', 'Eastern Europe', 'Prague', 'CZK', '+420'),
('DK', 'DNK', 'Denmark', 'Europe', 'Northern Europe', 'Copenhagen', 'DKK', '+45'),
('EE', 'EST', 'Estonia', 'Europe', 'Northern Europe', 'Tallinn', 'EUR', '+372'),
('FI', 'FIN', 'Finland', 'Europe', 'Northern Europe', 'Helsinki', 'EUR', '+358'),
('FR', 'FRA', 'France', 'Europe', 'Western Europe', 'Paris', 'EUR', '+33'),
('DE', 'DEU', 'Germany', 'Europe', 'Western Europe', 'Berlin', 'EUR', '+49'),
('GR', 'GRC', 'Greece', 'Europe', 'Southern Europe', 'Athens', 'EUR', '+30'),
('HU', 'HUN', 'Hungary', 'Europe', 'Eastern Europe', 'Budapest', 'HUF', '+36'),
('IS', 'ISL', 'Iceland', 'Europe', 'Northern Europe', 'Reykjavik', 'ISK', '+354'),
('IE', 'IRL', 'Ireland', 'Europe', 'Northern Europe', 'Dublin', 'EUR', '+353'),
('IT', 'ITA', 'Italy', 'Europe', 'Southern Europe', 'Rome', 'EUR', '+39'),
('XK', 'XKX', 'Kosovo', 'Europe', 'Southern Europe', 'Pristina', 'EUR', '+383'),
('LV', 'LVA', 'Latvia', 'Europe', 'Northern Europe', 'Riga', 'EUR', '+371'),
('LI', 'LIE', 'Liechtenstein', 'Europe', 'Western Europe', 'Vaduz', 'CHF', '+423'),
('LT', 'LTU', 'Lithuania', 'Europe', 'Northern Europe', 'Vilnius', 'EUR', '+370'),
('LU', 'LUX', 'Luxembourg', 'Europe', 'Western Europe', 'Luxembourg', 'EUR', '+352'),
('MT', 'MLT', 'Malta', 'Europe', 'Southern Europe', 'Valletta', 'EUR', '+356'),
('MD', 'MDA', 'Moldova', 'Europe', 'Eastern Europe', 'Chișinău', 'MDL', '+373'),
('MC', 'MCO', 'Monaco', 'Europe', 'Western Europe', 'Monaco', 'EUR', '+377'),
('ME', 'MNE', 'Montenegro', 'Europe', 'Southern Europe', 'Podgorica', 'EUR', '+382'),
('NL', 'NLD', 'Netherlands', 'Europe', 'Western Europe', 'Amsterdam', 'EUR', '+31'),
('MK', 'MKD', 'North Macedonia', 'Europe', 'Southern Europe', 'Skopje', 'MKD', '+389'),
('NO', 'NOR', 'Norway', 'Europe', 'Northern Europe', 'Oslo', 'NOK', '+47'),
('PL', 'POL', 'Poland', 'Europe', 'Eastern Europe', 'Warsaw', 'PLN', '+48'),
('PT', 'PRT', 'Portugal', 'Europe', 'Southern Europe', 'Lisbon', 'EUR', '+351'),
('RO', 'ROU', 'Romania', 'Europe', 'Eastern Europe', 'Bucharest', 'RON', '+40'),
('RU', 'RUS', 'Russia', 'Europe', 'Eastern Europe', 'Moscow', 'RUB', '+7'),
('SM', 'SMR', 'San Marino', 'Europe', 'Southern Europe', 'San Marino', 'EUR', '+378'),
('RS', 'SRB', 'Serbia', 'Europe', 'Southern Europe', 'Belgrade', 'RSD', '+381'),
('SK', 'SVK', 'Slovakia', 'Europe', 'Eastern Europe', 'Bratislava', 'EUR', '+421'),
('SI', 'SVN', 'Slovenia', 'Europe', 'Southern Europe', 'Ljubljana', 'EUR', '+386'),
('ES', 'ESP', 'Spain', 'Europe', 'Southern Europe', 'Madrid', 'EUR', '+34'),
('SE', 'SWE', 'Sweden', 'Europe', 'Northern Europe', 'Stockholm', 'SEK', '+46'),
('CH', 'CHE', 'Switzerland', 'Europe', 'Western Europe', 'Bern', 'CHF', '+41'),
('UA', 'UKR', 'Ukraine', 'Europe', 'Eastern Europe', 'Kyiv', 'UAH', '+380'),
('GB', 'GBR', 'United Kingdom', 'Europe', 'Northern Europe', 'London', 'GBP', '+44'),
('VA', 'VAT', 'Vatican City', 'Europe', 'Southern Europe', 'Vatican City', 'EUR', '+39'),

-- North America
('AG', 'ATG', 'Antigua and Barbuda', 'North America', 'Caribbean', 'Saint John''s', 'XCD', '+1'),
('BS', 'BHS', 'Bahamas', 'North America', 'Caribbean', 'Nassau', 'BSD', '+1'),
('BB', 'BRB', 'Barbados', 'North America', 'Caribbean', 'Bridgetown', 'BBD', '+1'),
('BZ', 'BLZ', 'Belize', 'North America', 'Central America', 'Belmopan', 'BZD', '+501'),
('CA', 'CAN', 'Canada', 'North America', 'Northern America', 'Ottawa', 'CAD', '+1'),
('CR', 'CRI', 'Costa Rica', 'North America', 'Central America', 'San José', 'CRC', '+506'),
('CU', 'CUB', 'Cuba', 'North America', 'Caribbean', 'Havana', 'CUP', '+53'),
('DM', 'DMA', 'Dominica', 'North America', 'Caribbean', 'Roseau', 'XCD', '+1'),
('DO', 'DOM', 'Dominican Republic', 'North America', 'Caribbean', 'Santo Domingo', 'DOP', '+1'),
('SV', 'SLV', 'El Salvador', 'North America', 'Central America', 'San Salvador', 'USD', '+503'),
('GD', 'GRD', 'Grenada', 'North America', 'Caribbean', 'Saint George''s', 'XCD', '+1'),
('GT', 'GTM', 'Guatemala', 'North America', 'Central America', 'Guatemala City', 'GTQ', '+502'),
('HT', 'HTI', 'Haiti', 'North America', 'Caribbean', 'Port-au-Prince', 'HTG', '+509'),
('HN', 'HND', 'Honduras', 'North America', 'Central America', 'Tegucigalpa', 'HNL', '+504'),
('JM', 'JAM', 'Jamaica', 'North America', 'Caribbean', 'Kingston', 'JMD', '+1'),
('MX', 'MEX', 'Mexico', 'North America', 'Central America', 'Mexico City', 'MXN', '+52'),
('NI', 'NIC', 'Nicaragua', 'North America', 'Central America', 'Managua', 'NIO', '+505'),
('PA', 'PAN', 'Panama', 'North America', 'Central America', 'Panama City', 'PAB', '+507'),
('KN', 'KNA', 'Saint Kitts and Nevis', 'North America', 'Caribbean', 'Basseterre', 'XCD', '+1'),
('LC', 'LCA', 'Saint Lucia', 'North America', 'Caribbean', 'Castries', 'XCD', '+1'),
('VC', 'VCT', 'Saint Vincent and the Grenadines', 'North America', 'Caribbean', 'Kingstown', 'XCD', '+1'),
('TT', 'TTO', 'Trinidad and Tobago', 'North America', 'Caribbean', 'Port of Spain', 'TTD', '+1'),
('US', 'USA', 'United States', 'North America', 'Northern America', 'Washington, D.C.', 'USD', '+1'),

-- South America
('AR', 'ARG', 'Argentina', 'South America', 'South America', 'Buenos Aires', 'ARS', '+54'),
('BO', 'BOL', 'Bolivia', 'South America', 'South America', 'Sucre', 'BOB', '+591'),
('BR', 'BRA', 'Brazil', 'South America', 'South America', 'Brasília', 'BRL', '+55'),
('CL', 'CHL', 'Chile', 'South America', 'South America', 'Santiago', 'CLP', '+56'),
('CO', 'COL', 'Colombia', 'South America', 'South America', 'Bogotá', 'COP', '+57'),
('EC', 'ECU', 'Ecuador', 'South America', 'South America', 'Quito', 'USD', '+593'),
('FK', 'FLK', 'Falkland Islands', 'South America', 'South America', 'Stanley', 'FKP', '+500'),
('GF', 'GUF', 'French Guiana', 'South America', 'South America', 'Cayenne', 'EUR', '+594'),
('GY', 'GUY', 'Guyana', 'South America', 'South America', 'Georgetown', 'GYD', '+592'),
('PY', 'PRY', 'Paraguay', 'South America', 'South America', 'Asunción', 'PYG', '+595'),
('PE', 'PER', 'Peru', 'South America', 'South America', 'Lima', 'PEN', '+51'),
('SR', 'SUR', 'Suriname', 'South America', 'South America', 'Paramaribo', 'SRD', '+597'),
('UY', 'URY', 'Uruguay', 'South America', 'South America', 'Montevideo', 'UYU', '+598'),
('VE', 'VEN', 'Venezuela', 'South America', 'South America', 'Caracas', 'VES', '+58'),

-- Oceania
('AU', 'AUS', 'Australia', 'Oceania', 'Australia and New Zealand', 'Canberra', 'AUD', '+61'),
('FJ', 'FJI', 'Fiji', 'Oceania', 'Melanesia', 'Suva', 'FJD', '+679'),
('KI', 'KIR', 'Kiribati', 'Oceania', 'Micronesia', 'Tarawa', 'AUD', '+686'),
('MH', 'MHL', 'Marshall Islands', 'Oceania', 'Micronesia', 'Majuro', 'USD', '+692'),
('FM', 'FSM', 'Micronesia', 'Oceania', 'Micronesia', 'Palikir', 'USD', '+691'),
('NR', 'NRU', 'Nauru', 'Oceania', 'Micronesia', 'Yaren', 'AUD', '+674'),
('NZ', 'NZL', 'New Zealand', 'Oceania', 'Australia and New Zealand', 'Wellington', 'NZD', '+64'),
('PW', 'PLW', 'Palau', 'Oceania', 'Micronesia', 'Ngerulmud', 'USD', '+680'),
('PG', 'PNG', 'Papua New Guinea', 'Oceania', 'Melanesia', 'Port Moresby', 'PGK', '+675'),
('WS', 'WSM', 'Samoa', 'Oceania', 'Polynesia', 'Apia', 'WST', '+685'),
('SB', 'SLB', 'Solomon Islands', 'Oceania', 'Melanesia', 'Honiara', 'SBD', '+677'),
('TO', 'TON', 'Tonga', 'Oceania', 'Polynesia', 'Nuku''alofa', 'TOP', '+676'),
('TV', 'TUV', 'Tuvalu', 'Oceania', 'Polynesia', 'Funafuti', 'AUD', '+688'),
('VU', 'VUT', 'Vanuatu', 'Oceania', 'Melanesia', 'Port Vila', 'VUV', '+678');