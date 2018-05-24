function convertDate(dates) {
    let results = [];
    for (let i = 0; i < dates.length; i++) {
        let date = dates[i].split("th");
        if (date.length === 1) {
            date = dates[i].split("st");
            if (date.length === 1) {
                date = dates[i].split("rd")
                if (date.length === 1) {
                    date = dates[i].split("nd")
                }
            }
        }
        results.push(new Date(date.join(" ")).toISOString().split('T')[0])
    }
    return results;
}


console.log(convertDate(["20th Oct 2052", "15th Oct 1987", "21st Nov 1985", "23rd Nov 2034", "22nd Nov 2034"]))