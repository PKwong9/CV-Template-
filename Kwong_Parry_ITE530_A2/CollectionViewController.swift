import UIKit

private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController {

    var myInfo = CVInfo() //create instance of CV information
    var selectedIndexPath: IndexPath!
    
    struct Storyboard{ //structure for collection view
        
        static let numberOfItemsPerRow: CGFloat = 3.0
        static let leftAndRightPaddings: CGFloat = 2.0
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myInfo.addImages() //adds images into an array
        
        //registers cell for reuse and sets layout of collection view
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        let collectionViewWidth = collectionView?.frame.width
        let itemWidth = (collectionViewWidth! - Storyboard.leftAndRightPaddings)/Storyboard.numberOfItemsPerRow
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize (width: itemWidth, height: itemWidth)

    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return myInfo.imageArray.count //number of items in collection
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.photoImage.image = UIImage (named: myInfo.imageArray[indexPath.row]) //sets cell image
    
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let image = UIImage( named: myInfo.imageArray[indexPath.item])
        
        self.selectedIndexPath = indexPath
        self.performSegue(withIdentifier: "ShowDetail", sender: image) //perform segue and send cell image
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { //segue to detail view of image
        
        if segue.identifier == "ShowDetail",
            let detailImageView = segue.destination as? CollectionDetailViewController
        {
                detailImageView.imageName = sender as! UIImage

        }
    }

}

extension CollectionViewController: ZoomingViewController {  //extension for zoom animation of image
    func zoomingBackgroundView(for transition: ZoomTransitioningDelegate) -> UIView? {
        return nil
    }
    
    func zoomingImageView(for transition: ZoomTransitioningDelegate) -> UIImageView? {
        if let indexPath = selectedIndexPath{
            let cell = collectionView?.cellForItem(at: indexPath) as! CollectionViewCell
            return cell.photoImage
        }
        return nil
    }
}
