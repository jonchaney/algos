// Write a function that takes this input as a parameter and returns a data structure containing the number of hits that were recorded on each domain AND each domain under it. For example, an impression on "sports.yahoo.com" counts for "sports.yahoo.com", "yahoo.com", and "com". (Subdomains are added to the left of their parent domain. So "sports" and "sports.yahoo" are not valid domains.)

// Expected output (in any order):
// 1320    com
//  900    google.com
//  410    yahoo.com
//   60    mail.yahoo.com
//   10    mobile.sports.yahoo.com
//   50    sports.yahoo.com
//   10    stackoverflow.com
//    3    org
//    3    wikipedia.org
//    2    en.wikipedia.org
//    1    es.wikipedia.org

var counts = [ "900,google.com",
    "60,mail.yahoo.com",
    "10,mobile.sports.yahoo.com",
    "40,sports.yahoo.com",
    "300,yahoo.com",
    "10,stackoverflow.com",
    "2,en.wikipedia.org",
    "1,es.wikipedia.org" ];

// create data structure
// add .com, .org -- check if it exists in object, if not add and add total
// add company -- check if it exists, if not add and add to total

// impressions = {
//   'com': 1320,
//   'google.com': 900,
// 
// }

const impression = (counts) => {
  let impressions = {};
  let domain;
  // create data structure
  counts.forEach((impression) => {
    domain = impression.split(',');
      impressions[domain[1]] = parseInt(domain[0]);      
  })
  
  for (let key in impressions) {
      let i = key.length-1
      while (i > 0) {
          if (key.charAt(i) === '.') {
              let substring = key.substring(i+1, key.length)
            if (!impressions[substring]) {
                impressions[substring] = impressions[key]
            } else {
                impressions[substring] += impressions[key]
            }
          }
          i-=1;
      }
    
  }
  
  return impressions;
}



console.log(impression(counts));


