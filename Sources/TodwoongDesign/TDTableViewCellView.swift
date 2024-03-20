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
    
    private var locationStackBottomConstraintTrue: NSLayoutConstraint?
    private var locationStackBottom8ConstraintFalse: NSLayoutConstraint?
    private var locationStackBottom0ConstraintFalse: NSLayoutConstraint?
    private var dateTimeStackBottomConstraint: NSLayoutConstraint?
    private var titleStackBottomConstraint: NSLayoutConstraint?
    private var groupLabelWidthConstraint: NSLayoutConstraint?
    
    // MARK: - UI Properties
    
    public lazy var checkButton: UIButton = {
        let button = UIButton(type: .system)
        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 22, weight: .medium, scale: .medium)
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
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UI and Layout Methods

extension TDTableViewCellView {
    private func setUI() {
        backgroundColor = .white
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(checkButtonTapped))
        titleLabel.addGestureRecognizer(tapGesture)
        
        [checkButton, titleLabel, groupLabel, dateLabel, locationStack].forEach {
            addSubview($0)
        }
    }
    
    private func setLayout() {
        
        NSLayoutConstraint.activate([
            checkButton.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            checkButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            groupLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: checkButton.trailingAnchor, constant: 16),
            groupLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 8),
            groupLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
        
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            dateLabel.leadingAnchor.constraint(equalTo: checkButton.trailingAnchor, constant: 16),
        ])
        
        NSLayoutConstraint.activate([
            locationStack.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 6),
            locationStack.leadingAnchor.constraint(equalTo: checkButton.trailingAnchor, constant: 16),
        ])
        
        locationStackBottomConstraintTrue = locationStack.bottomAnchor.constraint (
            equalTo: bottomAnchor,
            constant: -16
        )
        locationStackBottomConstraintTrue?.isActive = true
        
        locationStackBottom8ConstraintFalse = locationStack.bottomAnchor.constraint (
            equalTo: bottomAnchor,
            constant: -8
        )
        locationStackBottom8ConstraintFalse?.isActive = false
        
        
        locationStackBottom0ConstraintFalse = locationStack.bottomAnchor.constraint (
            equalTo: bottomAnchor,
            constant: 0
        )
        locationStackBottom0ConstraintFalse?.isActive = false
    }
    
    func resetData() {
        titleLabel.text = ""
        groupLabel.text = ""
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
    func configure(title: String,
                   group: String?,
                   dueTime: Date?,
                   placeName: String?,
                   iconImage: UIImage) {
        locationButton.setImage(iconImage.resized(to: CGSize(width: 16, height: 16)), for: .normal)
        
        titleLabel.text = title
        
        groupLabelWidthConstraint?.isActive = false
        if let groupTitle = group {
            groupLabel.text = "#\(groupTitle)"
            groupLabelWidthConstraint = groupLabel.widthAnchor.constraint(greaterThanOrEqualTo: widthAnchor, multiplier: 0.15)
        } else {
            groupLabel.text = ""
            groupLabelWidthConstraint = groupLabel.widthAnchor.constraint(greaterThanOrEqualTo: widthAnchor, multiplier: 0)
        }
        groupLabelWidthConstraint?.isActive = true
        
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
            locationButton.setTitle(location, for: .normal)
            locationStackBottomConstraintTrue?.isActive = true
        } else {
            locationButton.isHidden = true
            locationStack.isHidden = true
            
            locationStackBottomConstraintTrue?.isActive = false
            if placeName != nil {
                locationStackBottom0ConstraintFalse?.isActive = false
                locationStackBottom8ConstraintFalse?.isActive = true
            } else {
                locationStackBottom0ConstraintFalse?.isActive = true
                locationStackBottom8ConstraintFalse?.isActive = false
            }
        }
    }
}
