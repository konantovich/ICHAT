//
//  ListViewController.swift
//  ICHAT
//
//  Created by Antbook on 28.11.2021.
//

import UIKit



class ListViewController: UIViewController {
    
    
    
    let activeChats = Bundle.main.decode([MChat].self, from: "activeChats.json")
    let waitingChats = Bundle.main.decode([MChat].self, from: "waitingChats.json")
    
    
    
    enum Section: Int, CaseIterable {
        case waitingChats, activeChats
        
        func headerDescription (userCount: Int?) -> String {
            switch self {
            
            case .waitingChats:
                return "\(userCount ?? 0) chats confirmation waiting"
            case .activeChats:
                return "Message"
            }
        }
        
    }
    
    
    
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, MChat>?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupSearchBar()
        setupCollectionView()
        createDataSource()
        reloadData(with: nil)
        
    }
    
    //MARK: - setupSearchBar
    private func setupSearchBar () {
        
        navigationController?.navigationBar.barTintColor = .mainWhite()
        navigationController?.navigationBar.shadowImage = UIImage()
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        
    }
    
    //MARK: - setupCollectionView
    private func setupCollectionView () {
        
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayoutByCompositionLayout())
        
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .mainWhite()
        view.addSubview(collectionView)
        
        collectionView.register(ActiveChatCell.self, forCellWithReuseIdentifier: ActiveChatCell.reuseId)
        
        collectionView.register(WaitingChatCell.self, forCellWithReuseIdentifier: WaitingChatCell.reuseId)
        
        collectionView.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeader.reuseId)
        
    }
    
    //add to data source real data
    private func reloadData(with searchText: String?) {
        
        let filtered = activeChats.filter { user -> Bool in
            user.contains(filter: searchText)
        }
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, MChat>()
        snapshot.appendSections([.waitingChats, .activeChats])
        snapshot.appendItems(waitingChats, toSection: .waitingChats)
        snapshot.appendItems(filtered, toSection: .activeChats)
        dataSource?.apply(snapshot, animatingDifferences: true) //register snapshot
    }
    
}




//MARK: - SearchBarDelegate
extension ListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        reloadData(with: searchText)
    }
}


// MARK: - Setup data source
extension ListViewController {
    
    private func configure<T: SelfConfiguringCell, U: Hashable> (cellType: T.Type, with value: U, for indexPath: IndexPath) -> T {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.reuseId, for: indexPath) as? T else {fatalError("Enable to dequeue \(cellType)") }
        
        cell.configure(with: value)
        
        
        return cell
    }
    
    //manage data and provide cells for a collection view. 
    private func createDataSource () {
        dataSource = UICollectionViewDiffableDataSource<Section, MChat>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, chat) in
            guard let section = Section(rawValue: indexPath.section) else {
                fatalError("Unknown section kind")
            }
            switch section {
            
            case .activeChats:
                
                
                return self.configure(cellType: ActiveChatCell.self, with: chat, for: indexPath)
                
            case .waitingChats:
                
                
                return self.configure(cellType: WaitingChatCell.self, with: chat, for: indexPath)
                
            }
            
        })
        dataSource?.supplementaryViewProvider = {
            collectionView, kind, indexPath in
            guard let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeader.reuseId, for: indexPath) as? SectionHeader else {
                fatalError("Cant create new section header")
            }
            guard let section = Section(rawValue: indexPath.section) else {return
                fatalError("Unknown section kind") as! UICollectionReusableView
            }
            
            sectionHeader.configure(title: section.headerDescription(userCount: self.waitingChats.count), font: .laoSangamMN20(), textColor: #colorLiteral(red: 0.5725490196, green: 0.5725490196, blue: 0.5725490196, alpha: 1))
            return sectionHeader
        }
    }
}


//MARK: - Setup Layout
extension ListViewController {
    
    // create UICollectionViewLayout by CompositionLayout
    private func createLayoutByCompositionLayout () -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnviroment) -> NSCollectionLayoutSection? in
            guard let section = Section(rawValue: sectionIndex) else {
                fatalError("Unknown section kind")
            }
            
            switch section {
            case .waitingChats:
                return self.createWatingChats()
            case .activeChats:
                return self.createActiveChats()
                
            }
        }
        
        //Section spacing
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 20
        layout.configuration = config
        return layout
        
    }
    
    private func createWatingChats () -> NSCollectionLayoutSection {
        //UICollectionViewCompositionalLayout: section -> groups -> items -> size
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(88),
                                               heightDimension: .absolute(78))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 16 //spacing
        section.contentInsets = NSDirectionalEdgeInsets.init(top: 30, leading: 20, bottom: 0, trailing: 20)
        section.orthogonalScrollingBehavior = .continuous //add horizontal views
        
        let sectionHeader = createSectionHeader()
        section.boundarySupplementaryItems = [sectionHeader]//add header
        
        return section
    }
    
    private func createActiveChats () -> NSCollectionLayoutSection {
        
        //UICollectionViewCompositionalLayout: section -> groups -> items -> size
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(84))
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 8
        section.contentInsets = NSDirectionalEdgeInsets.init(top: 16, leading: 20, bottom: 0, trailing: 20)
        
        let sectionHeader = createSectionHeader()//add header
        section.boundarySupplementaryItems = [sectionHeader]
        
        return section
        
    }
    
    //Section header
    private func createSectionHeader () -> NSCollectionLayoutBoundarySupplementaryItem {
        
        let sectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(1))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: sectionHeaderSize,
                                                                        elementKind: UICollectionView.elementKindSectionHeader,
                                                                        alignment: .topLeading)
        return sectionHeader
        
    }
    
    
    
}



//MARK: - ADD CANVAS MODE to UIKit
import SwiftUI

//add canvas mode
struct ListProfileProvider: PreviewProvider {
    
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
        
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let viewController = MainTabBarController()
        
        func makeUIViewController(context: Context) -> some UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
    
}
