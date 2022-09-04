//
//  ContentView.swift
//  SwiftUI-Animation-Challanages-Challenge-1
//
//  Created by Arnold Plakolli on 4.9.22.
//

import SwiftUI

struct ContentView: View {
	private struct Item: Identifiable {
		let id: UUID = .init()
		var value: Double
	}
	
	private let size: CGSize = .init(width: 300, height: 300)
	@State private var items: [Item] = [
		.init(value: 0.1),
		.init(value: 0.5),
		.init(value: 0.75),
		.init(value: 0.25)
	]
	private let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
	
	var body: some View {
		ZStack {
			Color.black
			
			HStack {
				ForEach(items) { item in
					ZStack {
						ZStack(alignment: .bottom) {
							Color.clear
							Color.green
								.cornerRadius(5)
								.frame(height: size.height * item.value)
						}
						.frame(height: size.height)
					}
				}
			}
			.frame(width: size.width)
		}
		.ignoresSafeArea()
		.onReceive(timer) { _ in
			withAnimation {
				for i in 0..<items.count {
					items[i].value = Double.random(in: 0.1...1.0)
				}
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
