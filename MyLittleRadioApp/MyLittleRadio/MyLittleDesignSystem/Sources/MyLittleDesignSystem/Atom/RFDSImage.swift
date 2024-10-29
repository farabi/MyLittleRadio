//
//  RFDSImage.swift
//  MyLittleRadio
//
//  Created by Saad El Oulladi on 25/10/2024.
//

import SwiftUI

// MARK: RFDSImage

public struct RFDSImage: View {
    // MARK: Lifecycle

    public init(source: RFDSImage.Source,
                size: CGFloat? = nil,
                foregroundColor: Color? = nil) {
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
            self = .asyncImage(url, placeholder)
        }
    }

    public var body: some View {
        switch source {
        case let .image(image):
            imageView(image)
        case let .asyncImage(url, placeHolder):
            if let url {
                asyncImage(url, placeHolder)
            } else {
                placeHolderView(placeHolder)
            }
        }
    }

    // MARK: Private

    // MARK: Properties

    private let source: Source
    private let size: CGFloat?
    private let foregroundColor: Color?

    // MARK: ViewBuilders

    @ViewBuilder
    private func imageView(_ image: Image) -> some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fill)
            .foregroundColor(foregroundColor)
            .frame(width: size, height: size)
    }

    @ViewBuilder
    private func asyncImage(_ url: URL, _ placeHolder: Image?) -> some View {
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
    }

    @ViewBuilder
    private func placeHolderView(_ placeHolderImage: Image?) -> some View {
        placeHolderImage?
            .resizable()
            .aspectRatio(contentMode: .fill)
            .foregroundColor(foregroundColor)
            .frame(width: size, height: size)
    }
}
