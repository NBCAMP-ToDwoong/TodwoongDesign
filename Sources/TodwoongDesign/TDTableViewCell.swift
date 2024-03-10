
import UIKit

public class TDTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    public static var identifier = "TDTableViewCellIdentifier"
    
    public var onCheckButtonTapped: (() -> Void)?
    public var onLocationButtonTapped: (() -> Void)?
    
    private var locationStackBottomConstraintTrue: NSLayoutConstraint?
    private var locationStackBottom8ConstraintFalse: NSLayoutConstraint?
    private var locationStackBottom0ConstraintFalse: NSLayoutConstraint?
    private var dateTimeStackBottomConstraint: NSLayoutConstraint?
    private var titleStackBottomConstraint: NSLayoutConstraint?
    
    // MARK: - UI Properties
    
    public lazy var checkButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "circle"), for: .normal)
        button.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .selected)
        button.tintColor = TDStyle.color.mainTheme
        button.addTarget(self, action: #selector(checkButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = TDStyle.font.body(style: .bold)
        label.textColor = TDStyle.color.primaryLabel
        label.numberOfLines = 0
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
        
        return label
    }()
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.font = TDStyle.font.subheadline(style: .regular)
        label.textColor = TDStyle.color.secondaryLabel
        
        return label
    }()
    
    private lazy var dateTimeStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [dateLabel, timeLabel])
        stackView.axis = .horizontal
        stackView.spacing = 6
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
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
    
    // MARK: - Life Cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        
        titleLabel.text = ""
        groupLabel.text = ""
        dateLabel.text = ""
        locationButton.setTitle("", for: .normal)
    }
}

// MARK: - Extensions

extension TDTableViewCell {
    private func setUI() {
        selectionStyle = .none
        backgroundColor = .white
        
        [checkButton, titleLabel, groupLabel, dateTimeStack, locationStack].forEach {
            contentView.addSubview($0)
        }
    }
    
    private func setLayout() {
        
        NSLayoutConstraint.activate([
            checkButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            checkButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            groupLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: checkButton.trailingAnchor, constant: 16),
            groupLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 8),
            groupLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            groupLabel.widthAnchor.constraint(greaterThanOrEqualTo: contentView.widthAnchor, multiplier: 0.15)
        ])
        
        NSLayoutConstraint.activate([
            dateTimeStack.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            dateTimeStack.leadingAnchor.constraint(equalTo: checkButton.trailingAnchor, constant: 16),
        ])
        
        NSLayoutConstraint.activate([
            locationStack.topAnchor.constraint(equalTo: dateTimeStack.bottomAnchor, constant: 6),
            locationStack.leadingAnchor.constraint(equalTo: checkButton.trailingAnchor, constant: 16),
        ])
        
        // 하단 여백 조절 Auto Layout
        
        locationStackBottomConstraintTrue = locationStack.bottomAnchor.constraint(
            equalTo: contentView.bottomAnchor,
            constant: -16)
        locationStackBottomConstraintTrue?.isActive = true
        
        locationStackBottom8ConstraintFalse = locationStack.bottomAnchor.constraint(
            equalTo: contentView.bottomAnchor,
            constant: -8)
        locationStackBottom8ConstraintFalse?.isActive = false
        
        
        locationStackBottom0ConstraintFalse = locationStack.bottomAnchor.constraint(
            equalTo: contentView.bottomAnchor,
            constant: 0)
        locationStackBottom0ConstraintFalse?.isActive = false
    }
}

// MARK: - @objc Method
extension TDTableViewCell {
    @objc private func checkButtonTapped() {
        onCheckButtonTapped?()
    }
    
    @objc private func locationButtonTapped() {
        onLocationButtonTapped?()
    }
}

// MARK: - Configure Method

extension TDTableViewCell {
    public func configure(data: TodoModel, iconImage: UIImage) {
        locationButton.setImage(iconImage.resized(to: CGSize(width: 16, height: 16)), for: .normal)
        
        titleLabel.text = data.title
        
        if let category = data.category {
            groupLabel.text = "#\(category.title)"
        } else {
            groupLabel.text = ""
        }
        
        if let dueDate = data.dueDate {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy.MM.dd"
            dateLabel.text = formatter.string(from: dueDate)
        } else {
            dateLabel.isHidden = true
            
        }
        
        if let dueTime = data.dueTime {
            let formatter = DateFormatter()
            formatter.dateFormat = "a hh:mm"
            formatter.amSymbol = "오전"
            formatter.pmSymbol = "오후"
            timeLabel.text = formatter.string(from: dueTime)
        } else {
            timeLabel.isHidden = true
        }
        
        if let location = data.place {
            locationButton.setTitle(location, for: .normal)
        } else {
            locationButton.isHidden = true
            locationStack.isHidden = true
            
            locationStackBottomConstraintTrue?.isActive = false
            if data.dueDate != nil {
                locationStackBottom0ConstraintFalse?.isActive = false
                locationStackBottom8ConstraintFalse?.isActive = true
            } else {
                locationStackBottom0ConstraintFalse?.isActive = true
                locationStackBottom8ConstraintFalse?.isActive = false
            }
            
            contentView.layoutIfNeeded()
        }
    }
    
}
