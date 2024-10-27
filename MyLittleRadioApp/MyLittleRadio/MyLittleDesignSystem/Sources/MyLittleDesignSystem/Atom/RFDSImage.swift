//
//  RFDSImage.swift
//  MyLittleRadio
//
//  Created by Saad El Oulladi on 25/10/2024.
//

import SwiftUI

public struct RFDSImage: View {
    // MARK: Lifecycle

    public init(source: RFDSImage.Source, size: CGFloat? = nil, foregroundColor: Color? = nil) {
        self.source = source
        self.size = size
        self.foregroundColor = foregroundColor
    }

    // MARK: Public

    public enum Source {
        case image(Image)
        case asyncImage(URL?, Image?)

        // MARK: Lifecycle

        public init(url: URL, placeholder: Image?) {
            self = .asyncImage(url, placeholder) // Image(.placeholder)
        }
    }

    public var body: some View {
        switch source {
        case let .image(image):
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .foregroundColor(foregroundColor)
                .frame(width: size, height: size)
        case let .asyncImage(url, placeHolder):
            if let url {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    if let placeHolder {
                        placeHolder
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    }
                }
                .foregroundColor(foregroundColor)
                .frame(width: size, height: size)
            } else {
                placeHolder?
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .foregroundColor(foregroundColor)
                    .frame(width: size, height: size)
            }
        }
    }

    // MARK: Private

    private let source: Source
    private let size: CGFloat?
    private let foregroundColor: Color?
}
