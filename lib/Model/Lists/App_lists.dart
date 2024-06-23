
List<String> coutryList =[
  "India",
  "U.S.A",
  "London",
  "England",
  "Australia",
  "China",
  "Dubai",
  "New Zealand",
];
List<String> StateList =[
  "Gujarat",
  "Maharashtra",
  "Kerala",
  "Utter Pradesh",
  "Haryana",
  "Uttarakhand",
];
List<String> CityList =[
  "Surat",
  "Vadodara",
  "Ahmedabad",
  "Anand",
  "Jamnagar",
  "Rajkot",
];
List<String>fieldName=[
  "Full Name",
  "Phone",
  "Email",
  "Password",
  "Address",
];
final Map<String, Map<String, List<String>>> countriesData = {
  'India': {
    'Gujarat': ['Ahmedabad', 'Surat', 'Vadodara', 'Rajkot', 'Gandhinagar'],
    'Maharashtra': ['Mumbai', 'Pune', 'Nagpur', 'Nashik', 'Aurangabad'],
    'Delhi': ['New Delhi', 'Noida', 'Gurgaon'],
  },
  'United States': {
    'California': [
      'Los Angeles',
      'San Francisco',
      'San Diego',
      'Sacramento',
      'San Jose'
    ],
    'New York': [
      'New York City',
      'Buffalo',
      'Rochester',
      'Albany',
      'Syracuse'
    ],
    'Texas': ['Houston', 'Dallas', 'Austin', 'San Antonio', 'Fort Worth'],
  },
  'Canada': {
    'Ontario': ['Toronto', 'Ottawa', 'Hamilton', 'London', 'Mississauga'],
    'Quebec': ['Montreal', 'Quebec City', 'Laval', 'Gatineau', 'Longueuil'],
    'British Columbia': [
      'Vancouver',
      'Surrey',
      'Burnaby',
      'Richmond',
      'Kelowna'
    ],
  },
  'Australia': {
    'New South Wales': [
      'Sydney',
      'Newcastle',
      'Wollongong',
      'Central Coast',
      'Maitland'
    ],
    'Victoria': ['Melbourne', 'Geelong', 'Ballarat', 'Bendigo', 'Shepparton'],
    'Queensland': [
      'Brisbane',
      'Gold Coast',
      'Sunshine Coast',
      'Townsville',
      'Cairns'
    ],
  },
  'United Kingdom': {
    'England': ['London', 'Manchester', 'Birmingham', 'Liverpool', 'Bristol'],
    'Scotland': ['Glasgow', 'Edinburgh', 'Aberdeen', 'Dundee', 'Inverness'],
    'Wales': ['Cardiff', 'Swansea', 'Newport', 'Wrexham', 'Barry'],
  },
  // Add more countries here
};