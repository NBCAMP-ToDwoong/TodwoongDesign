//
//  TDTableViewCellView.swift
//
//
//  Created by yen on 3/20/24.
//

import UIKit

public class TDTableViewCellView: UIView {
    
    // MARK: - Properties
    
    public var onCheckButtonTapped: (() -> Void)?
    public var onLocationButtonTapped: (() -> Void)?
    
    private lazy var titleLabelBottomAnchorConstraint =
    titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
    private lazy var groupLabelWidthConstraint =
    groupLabel.widthAnchor.constraint(equalToConstant: 0)
    private lazy var dateLabelBottomAnchorConstraint =
    dateLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
    private lazy var locationStackTopAnchorConstraintToTitleLabel =
    locationStack.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10)
    private lazy var locationStackTopAnchorConstraintToDateLabel =
    locationStack.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 8)
    private lazy var locationStackBottomAnchorConstraint =
    locationStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
    
    private lazy var titleLabelTralingAnchorConstraintNonActiveGroup =
    titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
    private lazy var titleLabelTralingAnchorConstraintActiveGroup =
    titleLabel.trailingAnchor.constraint(equalTo: groupLabel.leadingAnchor, constant: -16)
    private lazy var groupLabelTralingAnchorConstraintNonActiveGroup =
    groupLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 8)
    private lazy var groupLabelTralingAnchorConstraintActiveGroup =
    groupLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
    
    
    // MARK: - UI Properties
    
    public lazy var checkButton: UIButton = {
        let button = UIButton()
        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 28, weight: .bold, scale: .medium)
        button.setPreferredSymbolConfiguration(symbolConfiguration, forImageIn: .normal)
        button.setPreferredSymbolConfiguration(symbolConfiguration, forImageIn: .selected)
        button.setImage(UIImage(systemName: "circle"), for: .normal)
        button.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .selected)
        button.tintColor = TDStyle.color.mainTheme
        
        button.addTarget(self, action: #selector(checkButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = TDStyle.font.title3(style: .bold)
        label.textColor = TDStyle.color.primaryLabel
        label.numberOfLines = 0
        
        label.isUserInteractionEnabled = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var groupLabel: UILabel = {
        let label = UILabel()
        label.font = TDStyle.font.subheadline(style: .regular)
        label.textColor = TDStyle.color.textGreen
        label.numberOfLines = 0
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = TDStyle.font.subheadline(style: .regular)
        label.textColor = TDStyle.color.secondaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var locationButton: UIButton = {
        var config = UIButton.Configuration.filled()
        
        config.baseForegroundColor = TDStyle.color.primaryLabel
        config.background.backgroundColor = TDStyle.color.lightGray
        
        config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { style in
            var title = style
            title.font = TDStyle.font.subheadline(style: .regular)
            return title
        }
        
        config.cornerStyle = .fixed
        config.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 6, bottom: 4, trailing: 6)
        
        config.imagePadding = 8
        
        let button = UIButton(configuration: config, primaryAction: UIAction(handler: { [weak self] _ in
            self?.locationButtonTapped()
        }))
        
        return button
    }()
    
    private lazy var locationStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [locationButton])
        stackView.axis = .horizontal
        stackView.spacing = 6
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private lazy var divider: UIView = {
        let view = UIView()
        
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UI and Layout Methods

extension TDTableViewCellView {
    private func setUI() {
        backgroundColor = .white
        
        [checkButton, titleLabel, groupLabel, dateLabel, locationStack].forEach {
            addSubview($0)
        }
    }
    
    private func setLayout(group: String?,
                           dueTime: Date?,
                           placeName: String?) {
        
        NSLayoutConstraint.activate([
            checkButton.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            checkButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            checkButton.widthAnchor.constraint(equalToConstant: 28),
            checkButton.heightAnchor.constraint(equalToConstant: 28),
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: checkButton.trailingAnchor, constant: 10),
        ])
        
        NSLayoutConstraint.activate([
            groupLabel.widthAnchor.constraint(equalToConstant: 80),
            groupLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
        ])
        
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            dateLabel.leadingAnchor.constraint(equalTo: checkButton.trailingAnchor, constant: 16),
        ])
        
        NSLayoutConstraint.activate([
            locationStack.leadingAnchor.constraint(equalTo: checkButton.trailingAnchor, constant: 16),
            locationStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
        
        // 하단 여백 조절 Auto Layout
        
        titleLabelBottomAnchorConstraint.isActive = false
        dateLabelBottomAnchorConstraint.isActive = false
        locationStackTopAnchorConstraintToDateLabel.isActive = false
        locationStackTopAnchorConstraintToTitleLabel.isActive = false
        locationStackBottomAnchorConstraint.isActive = false
        titleLabelTralingAnchorConstraintNonActiveGroup.isActive = false
        titleLabelTralingAnchorConstraintActiveGroup.isActive = false
        groupLabelTralingAnchorConstraintNonActiveGroup.isActive = false
        groupLabelTralingAnchorConstraintActiveGroup.isActive = false
        
        if dueTime != nil, placeName != nil {
            locationStackTopAnchorConstraintToDateLabel.isActive = true
            locationStackBottomAnchorConstraint.isActive = true
        } else if dueTime == nil, placeName != nil {
            locationStackTopAnchorConstraintToTitleLabel.isActive = true
            locationStackBottomAnchorConstraint.isActive = true
        } else if dueTime != nil, placeName == nil {
            dateLabelBottomAnchorConstraint.isActive = true
        } else {
            titleLabelBottomAnchorConstraint.isActive = true
        }
        
        if group == nil {
            groupLabel.isHidden = true
            titleLabelTralingAnchorConstraintNonActiveGroup.isActive = true
        } else {
            groupLabel.isHidden = false
            titleLabelTralingAnchorConstraintActiveGroup.isActive = true
            groupLabelTralingAnchorConstraintNonActiveGroup.isActive = true
            groupLabelTralingAnchorConstraintActiveGroup.isActive = true
        }
    }
    
    public func resetData() {
        titleLabel.text = ""
        groupLabel.text = ""
        groupLabel.isHidden = false
        dateLabel.text = ""
        dateLabel.isHidden = false
        locationButton.setTitle("", for: .normal)
        locationButton.isHidden = false
        locationStack.isHidden = false
    }
}

extension TDTableViewCellView {
    @objc private func checkButtonTapped() {
        onCheckButtonTapped?()
    }
    
    @objc private func locationButtonTapped() {
        onLocationButtonTapped?()
    }
}

extension TDTableViewCellView {
    public func configure(title: String,
                   group: String?,
                   groupColor: String?,
                   dueTime: Date?,
                   placeName: String?,
                   iconImage: UIImage) {
        locationButton.setImage(iconImage.resized(to: CGSize(width: 16, height: 16)), for: .normal)
        
        titleLabel.text = title
        
        if let groupTitle = group {
            groupLabel.text = "#\(groupTitle)"
            groupLabel.textColor = UIColor(hex: groupColor ?? "#5DB075")?.adjustColor(brightnessDecreaseFactor: 0.25, saturationIncreaseFactor: 0.4)
        } else {
            groupLabel.isHidden = true
        }
        
        if let dueDateValue = dueTime {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy.MM.dd a hh:mm"
            formatter.amSymbol = "오전"
            formatter.pmSymbol = "오후"
            dateLabel.text = formatter.string(from: dueDateValue)
        } else {
            dateLabel.isHidden = true
        }
        
        if let location = placeName {
            setButtonTitle(location, for: .normal)
        } else {
            locationButton.isHidden = true
            locationStack.isHidden = true
        }
        
        setLayout(group: group, dueTime: dueTime, placeName: placeName)
    }
    
    func setButtonTitle(_ title: String, for state: UIControl.State) {
        let maxLength = 27
        var trimmedTitle = title
        if title.count > maxLength {
            trimmedTitle = String(title.prefix(maxLength - 3)) + "..."
        }
        locationButton.setTitle(trimmedTitle, for: state)
    }

}
