function Bst(data) {
  this.data = data;
  this.right = null;
  this.left = null;
}

Bst.prototype.insert = function(data) {
  if (data <= this.data) {
    if (this.left) {
      this.left.insert(data);
    } else {
      this.left = new Bst(data);
    }
  } else if (data > this.data) {
    if (this.right) {
      this.right.insert(data);
    } else {
      this.right = new Bst(data);
    }
  }
};

Bst.prototype.each = function(fx) {
  if (this.left) {
    this.left.each(fx);
  }
  fx(this.data);
  if (this.right) {
    this.right.each(fx);
  }
};

module.exports = Bst;
