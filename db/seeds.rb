CATEGORIES_COUNT = 20
PRODUCTS_COUNT = 100
PHOTOS_COUNT = 5
REVIEWS_COUNT = 10

LOREMIPSUM = [
  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ac ipsum neque. 
  Proin dignissim, nulla nec mollis auctor, risus tortor volutpat leo, in eleifend libero tortor vel nunc. Duis ut rutrum massa. 
  Ut pretium, nunc ac cursus congue, tellus tellus fermentum metus, a gravida libero tellus elementum nisi. 
  In orci augue, egestas ac lectus eu, sodales accumsan libero. Vestibulum luctus in nunc et suscipit. 
  Donec consectetur porta viverra. Vestibulum a elit diam. Proin tempus aliquam arcu. 
  Pellentesque eu eros imperdiet, porttitor leo vitae, dignissim leo. Suspendisse diam ante, sodales ac rutrum at, tempor a est. 
  Donec molestie ultricies dapibus. In molestie erat ac lobortis bibendum. Quisque pellentesque nunc quis vestibulum pretium. 
  Integer ut aliquet nisi.",
  "Nulla vel nisl at quam ultrices cursus. In hac habitasse platea dictumst. Praesent rhoncus nisl non molestie semper. 
  Suspendisse iaculis porttitor mollis. Proin pellentesque viverra urna a rutrum. Curabitur semper vel risus vel lobortis. 
  Fusce consequat lacinia augue. Fusce dapibus scelerisque euismod.",
  "Nunc laoreet varius mauris, ac vestibulum nisi euismod eget. Vivamus mollis dictum ultrices. 
  Etiam non neque scelerisque, tincidunt dui non, accumsan dolor. Curabitur cursus scelerisque tortor nec dapibus. 
  In at elit dapibus, viverra nulla at, cursus felis. Cras eget nunc suscipit, volutpat dui tincidunt, dapibus erat. 
  Nunc fringilla metus euismod rhoncus tempor. Donec mollis imperdiet quam. Vivamus vitae tellus aliquam, porttitor lacus vel, scelerisque felis. 
  Suspendisse eu bibendum leo, ac sodales ligula. Praesent vulputate venenatis laoreet. Nulla ac vulputate eros. In hac habitasse platea dictumst.",
  "Donec placerat sollicitudin libero. Aenean iaculis ultricies tellus, id iaculis est pellentesque ut. Donec bibendum dapibus odio eu consequat. 
  Aenean sit amet accumsan tellus. Nullam non volutpat dolor. Ut vulputate in tortor ac placerat. Cras sit amet odio nec felis lobortis dignissim. 
  Phasellus fringilla purus in erat malesuada, at placerat orci posuere. Suspendisse eu lobortis ligula. Aliquam faucibus laoreet placerat.",
  "Proin mattis quis elit ac faucibus. Nullam sagittis diam ut massa facilisis rutrum. Ut cursus eleifend porta. 
  Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Mauris dolor eros, tempus at euismod ut, posuere eu mi. 
  Sed ac nulla vitae sapien congue viverra sit amet vitae ligula. Suspendisse potenti. Nunc at eros nisi. 
  Pellentesque venenatis, mauris ac ultrices elementum, velit arcu sodales felis, eget commodo purus erat nec nisl. 
  Nulla nisi augue, varius nec dictum nec, feugiat sit amet metus. Curabitur auctor est eu blandit bibendum. ",
  "Nullam eget nunc quam. Suspendisse quis leo a tortor rutrum mattis vel ac quam. Donec facilisis aliquam purus nec tempus. 
  In luctus lacinia quam, at accumsan arcu mattis et. Maecenas ut ante dignissim, luctus magna quis, scelerisque lacus. 
  Nullam et orci libero. Vivamus mattis metus a pellentesque malesuada. Maecenas egestas lorem non ultricies tempor.",
  "Nulla pharetra lorem at tellus tincidunt, vel tincidunt nisl porta. Morbi pharetra commodo tellus, eget varius erat ultricies sed. 
  Vestibulum varius, quam et placerat blandit, sem eros auctor ligula, a euismod lorem nibh a nisi. Vestibulum ac mauris at metus consequat aliquam. 
  Curabitur auctor tristique mollis. Aliquam vulputate, urna vel hendrerit laoreet, neque neque pulvinar ante, vel condimentum neque erat ut arcu. 
  Nunc sollicitudin velit eget fringilla pulvinar. Pellentesque cursus ac est ac auctor. Phasellus vitae sem adipiscing, pharetra sem luctus, interdum enim. 
  Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vivamus vehicula risus arcu, dictum pretium enim vestibulum sed. 
  Nam porttitor suscipit consectetur. ",
  "Maecenas congue mauris sed sapien rhoncus luctus. Praesent et felis sit amet ligula interdum pulvinar nec at orci. Sed sed porttitor lorem.
  Maecenas rhoncus metus non dapibus suscipit. Duis in diam risus. Sed condimentum lacinia egestas. Nunc sed semper purus. Ut tristique dolor eu rhoncus blandit. 
  Etiam feugiat metus quis neque adipiscing, eget ultrices augue placerat."
]

User.delete_all
Category.delete_all
Product.delete_all
Photo.delete_all

progress = ProgressBar.create(:title => "Categories", :starting_at => 0, :total => CATEGORIES_COUNT * PRODUCTS_COUNT)
[*1..CATEGORIES_COUNT].each do |idx|
  category = Category.new(name: "Category #{idx.to_s.rjust(3, '0')}")
  [*1..PRODUCTS_COUNT].each do |idx|
    product = category.products.build(name: "Product #{idx.to_s.rjust(3, '0')}", description: LOREMIPSUM.sample)
    [*1..PHOTOS_COUNT].each do |idx|
      photo = product.photos.build(name: "Photo #{idx}", description: LOREMIPSUM.sample)
      photo.save!
    end
    [*1..REVIEWS_COUNT].each do |idx|
      review = product.reviews.build(title: "Review #{idx}", details: LOREMIPSUM.sample)
      review.save!
    end
    product.save!
    progress.increment
  end
  category.save!
end
progress.finish