# frozen_string_literal: true

module NeighborhoodService
  module_function

  FROM_ZIP = {
    "10001" => "Chelsea",
    "10002" => "the Lower East Side",
    "10003" => "the Lower East Side",
    "10004" => "the Financial District",
    "10005" => "the Financial District",
    "10006" => "the Financial District",
    "10007" => "Tribeca",
    "10009" => "the East Village",
    "10010" => "Gramercy Park",
    "10011" => "Chelsea",
    "10012" => "Soho",
    "10013" => "Greenwich Village",
    "10014" => "Greenwich Village",
    "10016" => "Murray Hill",
    "10017" => "Midtown East",
    "10018" => "the Garment District",
    "10019" => "Hell's Kitchen",
    "10020" => "Midtown",
    "10021" => "the Upper East Side",
    "10022" => "Midtown East",
    "10023" => "the Upper West Side",
    "10024" => "the Upper West Side",
    "10025" => "the Upper West Side",
    "10026" => "Harlem",
    "10027" => "Harlem",
    "10028" => "the Upper East Side",
    "10029" => "East Harlem",
    "10030" => "Harlem",
    "10031" => "Hamilton Heights",
    "10032" => "Washington Heights",
    "10033" => "Hudson Heights",
    "10034" => "Inwood",
    "10035" => "East Harlem",
    "10036" => "Hell's Kitchen",
    "10037" => "Central Harlem",
    "10038" => "Lower Manhattan",
    "10039" => "Harlem",
    "10040" => "Inwood",
    "10044" => "Roosevelt Island",
    "10065" => "Lenox Hill",
    "10069" => "the Upper West Side",
    "10075" => "the Upper East Side",
    "10128" => "the Upper East Side",
    "10280" => "Battery Park City",
    "10282" => "Lower Manhattan",
    "10301" => "St. George",
    "10302" => "Port Richmond",
    "10303" => "Mariners Harbor",
    "10304" => "Fox Hills",
    "10305" => "Arrochar",
    "10306" => "New Dorp",
    "10307" => "Tottenville",
    "10308" => "Great Kills",
    "10309" => "the South Shore",
    "10310" => "Port Richmond",
    "10312" => "Annadale",
    "10314" => "Bulls Head",
    "10451" => "Highbridge",
    "10452" => "Highbridge",
    "10453" => "Morris Heights",
    "10454" => "Mott Haven",
    "10455" => "Mott Haven",
    "10456" => "Morrisania",
    "10457" => "West Bronx",
    "10458" => "Fordham",
    "10459" => "Foxhurst",
    "10460" => "West Farms",
    "10461" => "Morris Park",
    "10462" => "Parkchester",
    "10463" => "Kingsbridge",
    "10464" => "City Island",
    "10465" => "Throgs Neck",
    "10466" => "Wakefield",
    "10467" => "Norwood",
    "10468" => "Fordham Manor",
    "10469" => "Williamsbridge",
    "10470" => "Woodlawn Heights",
    "10471" => "Riverdale",
    "10472" => "Soundview",
    "10473" => "Soundview",
    "10474" => "Hunts Point",
    "10475" => "Co-op City",
    "11004" => "Glen Oaks",
    "11005" => "Glen Oaks",
    "11101" => "Long Island City",
    "11102" => "Astoria",
    "11103" => "Astoria",
    "11104" => "Sunyside",
    "11105" => "Ditmars Steinway",
    "11106" => "Astoria",
    "11109" => "Long Island City",
    "11201" => "Brooklyn Heights",
    "11203" => "East Flatbush",
    "11204" => "Mapleton",
    "11205" => "Fort Greene",
    "11206" => "East Williamsburg",
    "11207" => "East New York",
    "11208" => "East New York",
    "11209" => "Bay Ridge",
    "11210" => "Flatbush",
    "11211" => "Williamsburg",
    "11212" => "Brownsville",
    "11213" => "Crown Heights",
    "11214" => "Bensonhurst",
    "11215" => "Park Slope",
    "11216" => "Bedford-Stuyesant",
    "11217" => "Boerum Hill",
    "11218" => "Kensington",
    "11219" => "Borough Park",
    "11220" => "Sunset Park",
    "11221" => "Bushwick",
    "11222" => "Greenpoint",
    "11223" => "Gravesend",
    "11224" => "Seagate",
    "11225" => "Prospect Lefferts Gardens",
    "11226" => "Ditmas Park",
    "11228" => "Dyker Hieghts",
    "11229" => "Sheepshead Bay",
    "11230" => "Midwood",
    "11231" => "Red Hook",
    "11232" => "Sunset Park",
    "11233" => "Bedford-Stuyesant",
    "11234" => "Marine Park",
    "11235" => "Brighton Beach",
    "11236" => "Canarsie",
    "11237" => "Bushwick",
    "11238" => "Prospect Heights",
    "11239" => "East New York",
    "11249" => "Williamsburg",
    "11354" => "Flushing",
    "11355" => "Flushing",
    "11356" => "College Point",
    "11357" => "Whitestone",
    "11358" => "Auburndale",
    "11359" => "Fort Totten",
    "11360" => "Bay Terrace",
    "11361" => "Bayside",
    "11362" => "Little Neck",
    "11363" => "Douglaston",
    "11364" => "Bayside",
    "11365" => "Utopia",
    "11366" => "Fresh Meadows",
    "11367" => "Pomonok",
    "11368" => "Corona",
    "11369" => "Jackson Heights",
    "11370" => "Jackson Heights",
    "11372" => "Jackson Heights",
    "11373" => "Elmhurst",
    "11374" => "Rego Park",
    "11375" => "Forest Hills",
    "11377" => "Woodside",
    "11378" => "Maspeth",
    "11379" => "Middle Village",
    "11385" => "Ridgewood",
    "11411" => "Cambria Heights",
    "11412" => "Jamaica",
    "11413" => "Laurelton",
    "11414" => "Howard Beach",
    "11415" => "Kew Gardens",
    "11416" => "Ozone Park",
    "11417" => "Ozone Park",
    "11418" => "Richmond Hills",
    "11419" => "Ozone Park",
    "11420" => "South Ozone Park",
    "11421" => "Woodhaven",
    "11422" => "Rosedale",
    "11423" => "Jamaica",
    "11426" => "Glen Osks",
    "11427" => "Queens Village",
    "11428" => "Queens Village",
    "11429" => "Queens Village",
    "11432" => "Jamaica Hills",
    "11433" => "Jamaica",
    "11434" => "Rochdale",
    "11435" => "Briarwood",
    "11436" => "South Jamaica",
    "11691" => "Far Rockaway",
    "11692" => "Averne",
    "11693" => "Broad Channel",
    "11694" => "Seaside",
    "11695" => "Far Rockaway",
    "11697" => "Breezy Point",
  }.freeze

  def from_zip(zip)
    FROM_ZIP[zip] || raise(NonNycZipError)
  end

  class NonNycZipError < StandardError
  end
end
