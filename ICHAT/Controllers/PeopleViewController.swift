//
//  PeopleViewController.swift
//  ICHAT
//
//  Created by Antbook on 28.11.2021.
//

import UIKit



class PeopleViewController: UIViewController {
    
    let users = Bundle.main.decode([MUser].self, from: "users.json")
    var filtermUserArray = [MUser]()
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    
    var isFiltering: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
    
    enum SectionPeopleView: Int, CaseIterable {
        case users
        
        func headerDescription (userCount: Int?) -> String {
            switch self {
                
            case .users:
                return "\(userCount ?? 0) people nearbly"
            }
        }
    }
    
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<SectionPeopleView, MUser>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        view.backgroundColor = .white
        setupSearchBar ()
        setupCollectionView()
        createDataSource()
        reloadData()
        
    }

    
    
    //MARK: - setupCollectionView
    private func setupCollectionView () {
        
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayoutByCompositionLayout())
        
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .mainWhite()
        view.addSubview(collectionView)
        
        //collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellid")
        collectionView.register(PeopleChatCell.self, forCellWithReuseIdentifier: PeopleChatCell.reuseId)
        
        collectionView.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeader.reuseId)
    }
    
    //add to data source real data
    private func reloadData() {
        var snapshot = NSDiffableDataSourceSnapshot<SectionPeopleView, MUser>()
        snapshot.appendSections([.users])
        
        if isFiltering {
            snapshot.appendItems(filtermUserArray, toSection: .users)
        } else {
            snapshot.appendItems(users, toSection: .users)
        }
        dataSource?.apply(snapshot, animatingDifferences: true) //register snapshot
      
    }
    
}

//MARK: - SearchBar & SearchBarDelegate
extension PeopleViewController: UISearchBarDelegate, UISearchResultsUpdating {
    
    private func setupSearchBar () {
        
        navigationController?.navigationBar.barTintColor = .mainWhite()
        navigationController?.navigationBar.shadowImage = UIImage()
       
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        
    }
    func updateSearchResults(for searchController: UISearchController) {
       // filterContentForSearchText(searchController.searchBar.text!)
        searchBar(searchController.searchBar, textDidChange: searchController.searchBar.text!)
    }
    

    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        filtermUserArray = users.filter{
            
            $0.username.contains(searchText)
        }
        reloadData()
        print(filtermUserArray)
    }
}

// MARK: - Setup data source
extension PeopleViewController {
    
    //configure data source (name, image etc)
    private func configure<T: SelfConfiguringCell, U: Hashable> (cellType: T.Type, with value: U, for indexPath: IndexPath) -> T {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.reuseId, for: indexPath) as? T else {fatalError("Enable to dequeue \(cellType)") }
        
        cell.configure(with: value)
    
        return cell
    }
    
    private func createDataSource () {
        dataSource = UICollectionViewDiffableDataSource<SectionPeopleView, MUser>(collectionView: collectionView, cellProvider: { [self] collectionView, indexPath, user in
            guard let SectionPeaopleView = SectionPeopleView(rawValue: indexPath.section) else {
                fatalError("Unknown section kind")
            }
            
            switch SectionPeaopleView {
                
            case .users:
              
                return self.configure(cellType: PeopleChatCell.self, with: user, for: indexPath)
               
            }
            
        })
        
        dataSource?.supplementaryViewProvider = {
            collectionView, kind, indexPath in
            guard let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeader.reuseId, for: indexPath) as? SectionHeader else {
                fatalError("Cant create new section header")
            }
            guard let section = SectionPeopleView(rawValue: indexPath.section) else {return
                (fatalError("Unknown section kind") ) as! UICollectionReusableView
            }
            let items = self.dataSource.snapshot().itemIdentifiers(inSection: .users)
            sectionHeader.configure(title: section.headerDescription(userCount: items.count), font: .systemFont(ofSize: 36, weight: .light), textColor: .label)
            return sectionHeader
        }
    }
}


//MARK: - Setup Layout
extension PeopleViewController {
    
    // create UICollectionViewLayout by CompositionLayout
    private func createLayoutByCompositionLayout () -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnviroment) -> NSCollectionLayoutSection? in
            guard let section = SectionPeopleView(rawValue: sectionIndex) else {
                fatalError("Unknown section kind")
            }
            
            switch section {
            case .users:
                return self.createUserSection()
           
                
            }
        }
        return layout
        }
    
    private func createUserSection () -> NSCollectionLayoutSection {
        //UICollectionViewCompositionalLayout: section -> groups -> items -> size
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .fractionalWidth(0.5))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        group.interItemSpacing = .fixed(15)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 15 //spacing
        section.contentInsets = NSDirectionalEdgeInsets.init(top: 20, leading: 15, bottom: 0, trailing: 15)
        
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
struct PeopleProvider: PreviewProvider {
    
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

