module UsersHelper

  def position_options
    [
      'Teaching',
      'Teaching Assistant or Paraprofessional',
      'Substitute Teaching',
      'Instructional Coaching',
      'School Leadership (principal, assistant principal, dean, director, network director, etc.)',
      'Special Education Related Service Provider (clinicians such as speech language pathologist, occupational therapist, etc.)',
      'Student Academic Advising, College Counseling, Career Services or Alumni Support',
      'Social Work or Counseling',
      'Community/Parent Partnerships or Student Recruitment',
      'Facilities Maintenance or Custodian',
      'Front Office / Administrative',
      'Information Technology',
      'Data Management or Analysis',
      'Finance and Operations',
      'Human Resources',
      'Athletic Programs',
    ]
  end
  def resume_bank_references
    [
      'INCS website',
      'INCS email',
      'INCS Twitter',
      'INCS Facebook',
      'Eventbrite',
      'Friend or colleague',
      'Craigslist',
      'Idealist',
      'Indeed',
      'LinkedIn',
      'NPO.net',
      'Bronzecomm',
      'Chicago Latino Network',
      'HACE - Hispanic Alliance for Career Enhancement',
      'Surge Institute',
      'Austin Weekly',
      'Wednesday Journal',
    ]
  end

  def license_choices
    [
      {
        title: 'Professional Educator License (PEL)',
        values: [
          'Teacher',
          'School Support Personnel',
          'Administrative',
        ],
      }, {
        title: 'Educator License with Stipulations (ELS)',
        values: [
          'ELS Provisional Educator (ELS PEDU)', 
          'ELS Endorsed as a Paraprofessional (ELS PARA)',
        ],
      }, {
        title: 'Other', 
        values: [
          'Substitute Teaching License',
          'None'
        ],
      }
    ]
  end

  def endorsement_choices
    [
      {
        title: 'Teaching Endorsements',
        values: [
          'Early Childhood',
          'Elementary',
          'Middle Grades',
          'Secondary',
          'Special Education K-12',
          'Special Education Pre K-Age 21',
          'Early Childhood Special Education',
        ]
      }, {
        title: 'Subsequent Teaching Endorsements',
        values: [
          'Bilingual Education',
          'English as a Second Language (ESL)',
          'Reading Teacher',
          'Language Arts',
          'Mathematics',
          'Science',
          'Social Science',
          'Foreign Language (please specify which language/s in “Other”)',
        ]
      }, {
        title: 'School Support Personnel Endorsements',
        values: [
          'School Social Worker – Pre K-Age 21',
          'School Counselor – Pre K-Age 21',
          'School Psychologist – Pre K-Age 21',
          'School Nurse – Pre K-Age 21',
          'Speech-Language Pathologist (non-teaching) - Pre K-Age 21',
        ],
      }, {
        title: 'Administrative Endorsements',
        values: [
          'Chief School Business Official (CSBO) - Pre K-Grade 12',
          'Director of Special Education – Pre K-Grade 12',
          'Principal - Pre K-Grade 12',
          'Superintendent – Pre K-Grade 12',
          'Teacher Leader – Pre K-Grade 12',
        ],
      }, {
        title: 'Other', 
        values: [
          'None',
        ],
      }
    ]
  end
  def us_states
    [
      ['Alabama', 'AL'],
      ['Alaska', 'AK'],
      ['Arizona', 'AZ'],
      ['Arkansas', 'AR'],
      ['California', 'CA'],
      ['Colorado', 'CO'],
      ['Connecticut', 'CT'],
      ['Delaware', 'DE'],
      ['District of Columbia', 'DC'],
      ['Florida', 'FL'],
      ['Georgia', 'GA'],
      ['Hawaii', 'HI'],
      ['Idaho', 'ID'],
      ['Illinois', 'IL'],
      ['Indiana', 'IN'],
      ['Iowa', 'IA'],
      ['Kansas', 'KS'],
      ['Kentucky', 'KY'],
      ['Louisiana', 'LA'],
      ['Maine', 'ME'],
      ['Maryland', 'MD'],
      ['Massachusetts', 'MA'],
      ['Michigan', 'MI'],
      ['Minnesota', 'MN'],
      ['Mississippi', 'MS'],
      ['Missouri', 'MO'],
      ['Montana', 'MT'],
      ['Nebraska', 'NE'],
      ['Nevada', 'NV'],
      ['New Hampshire', 'NH'],
      ['New Jersey', 'NJ'],
      ['New Mexico', 'NM'],
      ['New York', 'NY'],
      ['North Carolina', 'NC'],
      ['North Dakota', 'ND'],
      ['Ohio', 'OH'],
      ['Oklahoma', 'OK'],
      ['Oregon', 'OR'],
      ['Pennsylvania', 'PA'],
      ['Puerto Rico', 'PR'],
      ['Rhode Island', 'RI'],
      ['South Carolina', 'SC'],
      ['South Dakota', 'SD'],
      ['Tennessee', 'TN'],
      ['Texas', 'TX'],
      ['Utah', 'UT'],
      ['Vermont', 'VT'],
      ['Virginia', 'VA'],
      ['Washington', 'WA'],
      ['West Virginia', 'WV'],
      ['Wisconsin', 'WI'],
      ['Wyoming', 'WY'],
      ['International', 'N/A']
    ]
  end

  def countries
    [
      ["United States",'US'],
      ["Andorra",'AD'],
      ["United Arab Emirates",'AE'],
      ["Afghanistan",'AF'],
      ["Antigua and Barbuda",'AG'],
      ["Anguilla",'AI'],
      ["Albania",'AL'],
      ["Armenia",'AM'],
      ["Netherlands Antilles",'AN'],
      ["Angola",'AO'],
      ["Antarctica",'AQ'],
      ["Argentina",'AR'],
      ["American Samoa",'AS'],
      ["Austria",'AT'],
      ["Australia",'AU'],
      ["Aruba",'AW'],
      ["Aland Islands",'AX'],
      ["Azerbaijan",'AZ'],
      ["Bosnia and Herzegovina",'BA'],
      ["Barbados",'BB'],
      ["Bangladesh",'BD'],
      ["Belgium",'BE'],
      ["Burkina Faso",'BF'],
      ["Bulgaria",'BG'],
      ["Bahrain",'BH'],
      ["Burundi",'BI'],
      ["Benin",'BJ'],
      ["Saint Barthélemy",'BL'],
      ["Bermuda",'BM'],
      ["Brunei",'BN'],
      ["Bolivia",'BO'],
      ["British Antarctic Territory",'BQ'],
      ["Brazil",'BR'],
      ["Bahamas",'BS'],
      ["Bhutan",'BT'],
      ["Bouvet Island",'BV'],
      ["Botswana",'BW'],
      ["Belarus",'BY'],
      ["Belize",'BZ'],
      ["Canada",'CA'],
      ["Cocos Islands",'CC'],
      ["Congo - Kinshasa",'CD'],
      ["Central African Republic",'CF'],
      ["Congo - Brazzaville",'CG'],
      ["Switzerland",'CH'],
      ["Ivory Coast",'CI'],
      ["Cook Islands",'CK'],
      ["Chile",'CL'],
      ["Cameroon",'CM'],
      ["China",'CN'],
      ["Colombia",'CO'],
      ["Costa Rica",'CR'],
      ["Serbia and Montenegro",'CS'],
      ["Canton and Enderbury Islands",'CT'],
      ["Cuba",'CU'],
      ["Cape Verde",'CV'],
      ["Christmas Island",'CX'],
      ["Cyprus",'CY'],
      ["Czech Republic",'CZ'],
      ["East Germany",'DD'],
      ["Germany",'DE'],
      ["Djibouti",'DJ'],
      ["Denmark",'DK'],
      ["Dominica",'DM'],
      ["Dominican Republic",'DO'],
      ["Algeria",'DZ'],
      ["Ecuador",'EC'],
      ["Estonia",'EE'],
      ["Egypt",'EG'],
      ["Western Sahara",'EH'],
      ["Eritrea",'ER'],
      ["Spain",'ES'],
      ["Ethiopia",'ET'],
      ["Finland",'FI'],
      ["Fiji",'FJ'],
      ["Falkland Islands",'FK'],
      ["Micronesia",'FM'],
      ["Faroe Islands",'FO'],
      ["French Southern and Antarctic Territories",'FQ'],
      ["France",'FR'],
      ["Metropolitan France",'FX'],
      ["Gabon",'GA'],
      ["United Kingdom",'GB'],
      ["Grenada",'GD'],
      ["Georgia",'GE'],
      ["French Guiana",'GF'],
      ["Guernsey",'GG'],
      ["Ghana",'GH'],
      ["Gibraltar",'GI'],
      ["Greenland",'GL'],
      ["Gambia",'GM'],
      ["Guinea",'GN'],
      ["Guadeloupe",'GP'],
      ["Equatorial Guinea",'GQ'],
      ["Greece",'GR'],
      ["South Georgia and the South Sandwich Islands",'GS'],
      ["Guatemala",'GT'],
      ["Guam",'GU'],
      ["Guinea-Bissau",'GW'],
      ["Guyana",'GY'],
      ["Hong Kong SAR China",'HK'],
      ["Hong Kong",'HK'],
      ["Heard Island and McDonald Islands",'HM'],
      ["Honduras",'HN'],
      ["Croatia",'HR'],
      ["Haiti",'HT'],
      ["Hungary",'HU'],
      ["Indonesia",'ID'],
      ["Ireland",'IE'],
      ["Israel",'IL'],
      ["Isle of Man",'IM'],
      ["India",'IN'],
      ["British Indian Ocean Territory",'IO'],
      ["Iraq",'IQ'],
      ["Iran",'IR'],
      ["Iceland",'IS'],
      ["Italy",'IT'],
      ["Jersey",'JE'],
      ["Jamaica",'JM'],
      ["Jordan",'JO'],
      ["Japan",'JP'],
      ["Johnston Island",'JT'],
      ["Kenya",'KE'],
      ["Kyrgyzstan",'KG'],
      ["Cambodia",'KH'],
      ["Kiribati",'KI'],
      ["Comoros",'KM'],
      ["Saint Kitts and Nevis",'KN'],
      ["North Korea",'KP'],
      ["South Korea",'KR'],
      ["Kuwait",'KW'],
      ["Cayman Islands",'KY'],
      ["Kazakhstan",'KZ'],
      ["Laos",'LA'],
      ["Lebanon",'LB'],
      ["Saint Lucia",'LC'],
      ["Liechtenstein",'LI'],
      ["Sri Lanka",'LK'],
      ["Liberia",'LR'],
      ["Lesotho",'LS'],
      ["Lithuania",'LT'],
      ["Luxembourg",'LU'],
      ["Latvia",'LV'],
      ["Libya",'LY'],
      ["Morocco",'MA'],
      ["Monaco",'MC'],
      ["Moldova",'MD'],
      ["Montenegro",'ME'],
      ["Saint Martin",'MF'],
      ["Madagascar",'MG'],
      ["Marshall Islands",'MH'],
      ["Midway Islands",'MI'],
      ["Macedonia",'MK'],
      ["Mali",'ML'],
      ["Myanmar",'MM'],
      ["Mongolia",'MN'],
      ["Macau SAR China",'MO'],
      ["Macau",'MO'],
      ["Northern Mariana Islands",'MP'],
      ["Martinique",'MQ'],
      ["Mauritania",'MR'],
      ["Montserrat",'MS'],
      ["Malta",'MT'],
      ["Mauritius",'MU'],
      ["Maldives",'MV'],
      ["Malawi",'MW'],
      ["Mexico",'MX'],
      ["Malaysia",'MY'],
      ["Mozambique",'MZ'],
      ["Namibia",'NA'],
      ["New Caledonia",'NC'],
      ["Niger",'NE'],
      ["Norfolk Island",'NF'],
      ["Nigeria",'NG'],
      ["Nicaragua",'NI'],
      ["Netherlands",'NL'],
      ["Norway",'NO'],
      ["Nepal",'NP'],
      ["Dronning Maud Land",'NQ'],
      ["Nauru",'NR'],
      ["Neutral Zone",'NT'],
      ["Niue",'NU'],
      ["New Zealand",'NZ'],
      ["Oman",'OM'],
      ["Panama",'PA'],
      ["Pacific Islands Trust Territory",'PC'],
      ["Peru",'PE'],
      ["French Polynesia",'PF'],
      ["Papua New Guinea",'PG'],
      ["Philippines",'PH'],
      ["Pakistan",'PK'],
      ["Poland",'PL'],
      ["Saint Pierre and Miquelon",'PM'],
      ["Pitcairn",'PN'],
      ["Puerto Rico",'PR'],
      ["Palestinian Territory",'PS'],
      ["Portugal",'PT'],
      ["U.S. Miscellaneous Pacific Islands",'PU'],
      ["Palau",'PW'],
      ["Paraguay",'PY'],
      ["Panama Canal Zone",'PZ'],
      ["Qatar",'QA'],
      ["Outlying Oceania",'QO'],
      ["European Union",'QU'],
      ["Reunion",'RE'],
      ["Romania",'RO'],
      ["Serbia",'RS'],
      ["Russia",'RU'],
      ["Rwanda",'RW'],
      ["Saudi Arabia",'SA'],
      ["Solomon Islands",'SB'],
      ["Seychelles",'SC'],
      ["Sudan",'SD'],
      ["Sweden",'SE'],
      ["Singapore",'SG'],
      ["Saint Helena",'SH'],
      ["Slovenia",'SI'],
      ["Svalbard and Jan Mayen",'SJ'],
      ["Slovakia",'SK'],
      ["Sierra Leone",'SL'],
      ["San Marino",'SM'],
      ["Senegal",'SN'],
      ["Somalia",'SO'],
      ["Suriname",'SR'],
      ["Sao Tome and Principe",'ST'],
      ["Union of Soviet Socialist Republics",'SU'],
      ["El Salvador",'SV'],
      ["Syria",'SY'],
      ["Swaziland",'SZ'],
      ["Turks and Caicos Islands",'TC'],
      ["Chad",'TD'],
      ["French Southern Territories",'TF'],
      ["Togo",'TG'],
      ["Thailand",'TH'],
      ["Tajikistan",'TJ'],
      ["Tokelau",'TK'],
      ["East Timor",'TL'],
      ["Turkmenistan",'TM'],
      ["Tunisia",'TN'],
      ["Tonga",'TO'],
      ["Turkey",'TR'],
      ["Trinidad and Tobago",'TT'],
      ["Tuvalu",'TV'],
      ["Taiwan",'TW'],
      ["Tanzania",'TZ'],
      ["Ukraine",'UA'],
      ["Uganda",'UG'],
      ["United States Minor Outlying Islands",'UM'],
      ["Uruguay",'UY'],
      ["Uzbekistan",'UZ'],
      ["Vatican",'VA'],
      ["Saint Vincent and the Grenadines",'VC'],
      ["North Vietnam",'VD'],
      ["Venezuela",'VE'],
      ["British Virgin Islands",'VG'],
      ["U.S. Virgin Islands",'VI'],
      ["Vietnam",'VN'],
      ["Vanuatu",'VU'],
      ["Wallis and Futuna",'WF'],
      ["Wake Island",'WK'],
      ["Samoa",'WS'],
      ["People's Democratic Republic of Yemen",'YD'],
      ["Yemen",'YE'],
      ["Mayotte",'YT'],
      ["South Africa",'ZA'],
      ["Zambia",'ZM'],
      ["Zimbabwe",'ZW'],
      ["Unknown or Invalid Region",'ZZ'],
    ]
  end

  def degrees
    [
      "Associate",
      "Associate in progress",
      "Bachelor's",
      "Bachelor's in progress",
      "Master's",
      "Master's in progress",
      "Doctorate",
      "Doctorate in progress",
    ]
  end

  def exp_years
    [
      0,
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9,
      "10+",
      "N/A or not a teacher/school administrator",
    ]
  end

  def exp_years_search
    [
      "Any",
      0,
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9,
      "10+",
    ]
  end

  def selectable_subjects
    [
      'N/A',
      'All Subjects',
      'General Education',
      'Bilingual Teacher',
      'English Language Learners',
      'Special Education',
      'Mathematics',
      'Science',
      'Language Arts',
      'Social Studies',
      'Art',
      'Music',
      'Physical Education',
    ]
  end

  def grades
    [
      "Pre K",
      "Kindergarten",
      "Primary (1st-2nd)",
      "Elementary (3rd-5th)",
      "Middle School (6th-8th)",
      "High School (9th-12th)",
      "No preference",
    ]
  end

  def grades_search
    [
      "Any",
      "Pre-k",
      "Kindergarten",
      "Primary (1st-2nd)",
      "Elementary (3rd-5th)",
      "Middle School (6th-8th)",
      "High School (9th-12th)",
    ]
  end

  def prefixes
    [
      "Mr.",
      "Ms.",
    ]
  end
end
