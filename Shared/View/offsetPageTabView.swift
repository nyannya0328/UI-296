//
//  offsetPageTabView.swift
//  offsetPageTabView
//
//  Created by nyannyan0328 on 2021/08/28.
//

import SwiftUI

struct offsetPageTabView<Content : View>: UIViewRepresentable {
    func makeCoordinator() -> Coordinator {
        return offsetPageTabView.Coordinator(parent: self)
    }
    
    
    var content : Content
    @Binding var offset : CGFloat
    
    init(offset : Binding<CGFloat>,@ViewBuilder content : @escaping()->Content) {
        
        self._offset = offset
        self.content = content()
 
    }
    
    let scroll = UIScrollView()
    
    func makeUIView(context: Context) -> UIScrollView{
        
        
        setUpScroll(scroll)
        scroll.delegate = context.coordinator
        return scroll
        
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        
        
        let currentOffset = uiView.contentOffset.x
        
        if offset != currentOffset{
            
            uiView.setContentOffset(CGPoint(x: offset, y: 0), animated: true)
            
            
        }
        
    }
    
    func setUpScroll(_ scroll : UIScrollView){
        
        scroll.isPagingEnabled = true
        scroll.showsHorizontalScrollIndicator = false
        scroll.showsVerticalScrollIndicator = false
        
        let hostView = UIHostingController(rootView: content)
        
        
        hostView.view.backgroundColor = .clear
        hostView.view.translatesAutoresizingMaskIntoConstraints = false
        
        let contains = [
        
            hostView.view.topAnchor.constraint(equalTo: scroll.topAnchor),
            hostView.view.bottomAnchor.constraint(equalTo: scroll.bottomAnchor),
            hostView.view.leadingAnchor.constraint(equalTo: scroll.leadingAnchor),
            hostView.view.trailingAnchor.constraint(equalTo: scroll.trailingAnchor),
            hostView.view.heightAnchor.constraint(equalTo: scroll.heightAnchor),
        
        
        ]
        
        scroll.addConstraints(contains)
        scroll.addSubview(hostView.view)
    
        
        
        
        
        
    }
    
    class Coordinator : NSObject,UIScrollViewDelegate{
        
        var parent : offsetPageTabView
        
        init(parent : offsetPageTabView) {
            self.parent = parent
        }
        
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let offset = scrollView.contentOffset.x
            
            parent.offset = offset
        }
        
        
        
    }
    

    
    
}

struct offsetPageTabView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
