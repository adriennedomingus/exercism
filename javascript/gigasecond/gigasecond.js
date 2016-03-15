function Gigasecond(date) {
	this.startDate = date;
}

Gigasecond.prototype.date = function() {
	var startTime = this.startDate.getTime();
	return new Date(startTime + 1000000000000);
}

module.exports = Gigasecond;
